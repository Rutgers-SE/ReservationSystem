require 'byebug'
class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy, :validate]
  before_action :authenticate_customer!

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = current_customer.reservations.all
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
    return render :new unless Reservation.remote_reserve(@reservation)

    if @reservation.save
      redirect_to new_payment_path(reservation_id: @reservation.id), {
        notice: 'Reservation was successfully created.'
      }
    else
      Reservation.remote_remove @reservation
      render :new
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
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def validate
    # need to add more stuff to make sure nothing sketchy happens
    @reservation.is_validated = true
    @reservation.save
    redirect_to root_path, notice: "Reservation Created Successfully"
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
