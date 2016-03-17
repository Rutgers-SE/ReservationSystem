require 'byebug'
class PaymentsController < ApplicationController
  before_filter :authenticate_customer!, only: [:create]

  def new
  end

  def create
    @amount = 500 # this should change depending on the duration of the reservation

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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end


end
