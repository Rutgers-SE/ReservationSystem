class DashboardController < ApplicationController
  before_action :authenticate_owner!

  def profit
    @profit_made = Transaction.total_finalized
    @profit_estimated = Transaction.total_finalized
    @percent_complete = Transaction.percent_complete
  end

  def switch
    @price = Price.last
    @transactions = Transaction.all
    # this won't be complete for the first demo.
    # the we are not ready.
  end
end
