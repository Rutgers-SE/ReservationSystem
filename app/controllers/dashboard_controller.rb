class DashboardController < ApplicationController
  def profit
    @profit_made = Transaction.total_finalized
    @profit_estimated = Transaction.total_finalized
    @percent_complete = Transaction.percent_complete
  end

  def switch
    # this won't be complete for the first demo.
    # the we are not ready.
  end
end