class PricesController < ApplicationController

  def index
    @prices = Price.all
  end

  def new
    @price = Price.new
  end

  def assign_price
    @prices = Price.all
    @owners = Owner.all

    # I can abstract this
    @payment_types = [
      ["Per Hour", 'per-hour'],
      ["One Time", 'one-time']
    ]
  end

  def create
    @price = Price.new(price_params)

    if @price.save
        redirect_to prices_path
      else
        flas[:notice] = "something went wrong?"
        render :new
    end

  end

  private

  def price_params
    params.require(:price).permit([:pennies])
  end

end
