class HomeController < ApplicationController
  layout 'frontpage'
  def index
    if owner_signed_in?
      redirect_to dashboard_path
    end
  end
end
