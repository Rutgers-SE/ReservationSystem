require 'rest-client'
class Reservation < ActiveRecord::Base
  belongs_to :customers
  
  before_save :reserve_in_garage
  
  private
  
  def reserve_in_garage
    ##### Uncomment this and change the url to the proper url when ready
    ##### testing for integration.
    # url = 'https://garagesyst-oufo.c9users.io'
    # response = RestClient.get "#{url}/api/garage/reserve", accept: :json, params: { start: @start, finish: @finish }
    # outcome = JSON.parse response.to_s
    
    # if outcome[:error]
    #     return false
    # end

    return true
  end

end
