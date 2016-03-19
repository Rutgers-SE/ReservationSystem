require 'byebug'
class PaymentsController < ApplicationController
  before_filter :authenticate_customer!, only: [:create]
  before_filter :set_reservation, only: [:create, :new]

  def index
  end


  def new
    @price = Price.last.pennies
    @amount = @price * @reservation.hours
  end

  def create
    #price = Price.last.pennies
    #@amount = (price * @reservation.hours).to_i
    @amount = @reservation.calculate_cost Price.last.pennies

    customer = Stripe::Customer.create(
      :email => current_customer.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    redirect_to validate_reservation_path(@reservation)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

end
