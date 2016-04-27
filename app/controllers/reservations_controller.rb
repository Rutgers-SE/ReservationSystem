require 'byebug'
require 'stripe'
class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy, :validate]
  before_action :authenticate_customer!, except: [:valid_qr]
  layout "qr", only: 'qr_code'

  # GET /reservations
  # GET /reservations.json
  def index
    @transactions = Transaction.where(customer_id: current_customer.id)
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end


  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    # reserve space in the garage (REST API)
    unless Reservation.remote_space_check(@reservation)
      puts "No space"
      return redirect_to  :back, notice: "Space not available in the reservation system"
    end


    # attemp to save
    if @reservation.save
      unless Reservation.remote_reserve_space(@reservation)
        @reservation.destroy
        puts "Too slow"
        return  redirect_to :back, notice: "Someone snagged your spot before you did.... sorry... This could be fixed with a form timer when creating a reservation."
      end
      redirect_to new_payment_path(reservation_id: @reservation.id), {
                    notice: 'Reservation was successfully created.'
                  }
    else
      # if the reservation did not save successfully
      # remove the reservation
      Reservation.remote_remove @reservation
      puts 'Not saved'
      redirect_to :back, notice: "Your reservation could not be created successfully"
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    tid = params[:transaction_id]
    # byebug
    transaction = Transaction.find(tid)

    Stripe::Refund.create charge: transaction.charge_id

    if @reservation.destroy
      transaction.destroy # hopefully this works
      respond_to do |format|
        format.html { redirect_to reservations_path, notice: 'Reservation was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        transactionlist.destroy
        format.html { redirect_to reservations_path, notice: 'Could not successfully remove the reservation' }
        format.json { head :no_content }
      end
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to reservations_path
    format.html { redirect_to reservations_url, notice: 'Reservation was unsuccessfu destroyed.' }
    format.json { head :no_content }
  end



  # Validates the reservation to
  def validate
    # need to add more stuff to make sure nothing sketchy happens
    @reservation.is_validated = true
    @reservation.save
    redirect_to root_path, notice: "Reservation Created Successfully"
  end

  def qr_code
    tid = params[:transaction_id]
    @t = Transaction.find(tid)
  end

  # this is apart of the reservation REST API.
  # this is the only endpoint we need... (so far)
  def valid_qr
    code = params[:qr_data]
    respond_to do |format|
      if Transaction.valid_qr @reservation, code
        format.html { render json: { status: true, message: "Valid qr code" }}
        format.json { render json: { status: true, message: "Valid qr code" }} 
      else 
        format.html { render json: { status: false, error: "Nah dude, your trying to fake out the system" }}
        format.json { render json: { status: false, error: "Nah dude, your trying to fake out the system" }}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:start, :finish, :customer_id)
  end
end
