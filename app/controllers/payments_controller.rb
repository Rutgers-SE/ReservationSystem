class PaymentsController < ApplicationController
  before_filter :authenticate_customer!, only: [:create, :refund, :new]
  before_filter :set_reservation, only: [:create, :new, :refund]

  def index
  end


  def new
    @price = Price.last.pennies
    @amount = @price * @reservation.hours
  end

  def create
    @price = Price.last
    @amount = @reservation.calculate_cost_in_pennies @price.pennies

    customer = Stripe::Customer.create(
      :email => current_customer.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    transaction = Transaction.new(
      price_id: @price.id,
      reservation_id: @reservation.id,
      customer_id: current_customer.id,
      charge_id: charge.id,
    )

    if transaction.save       
      # send the to the user
      NotificationMailer.reservation_send_notification(transaction)
      redirect_to validate_reservation_path(@reservation)
    else
      render :new, notice: "Please call our hotline"
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end

  def refund
    return redirect_to reservations_path unless @reservation.is_valid


    customer = Stripe::Customer.create(
      email: current_customer.email,
    )

    refund = Stripe::Refund.create(
      customer: customer.id,
      amount: @reservation.calculate_cost(Price.last.pennies),
      description: "Galaxy Garage Reservation Refund",
      currency: 'usd'
    )
    
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

end
