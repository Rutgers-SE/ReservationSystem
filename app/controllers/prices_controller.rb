class PricesController < ApplicationController

  def index
    @prices = Price.all
    @current_price = Price.last
  end

  def new
    @price = Price.new
  end

  def assign_price
    @prices = Price.all
    @owners = Object.constants
      .select { |c| defined? Object.const_get(c).purchasable }
      .map { |c| [c.to_s, c.to_s]}

    @payment_types = [
      ["Per Hour", 'per-hour'],
      ["One Time", 'one-time']
    ]
  end

  def create
    @price = Price.new(price_params)

    if @price.save
        redirect_to dashboard_path
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
