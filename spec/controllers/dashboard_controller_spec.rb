require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "GET #profit" do
    it "returns http success" do
      get :profit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #switch" do
    it "returns http success" do
      get :switch
      expect(response).to have_http_status(:success)
    end
  end

end
