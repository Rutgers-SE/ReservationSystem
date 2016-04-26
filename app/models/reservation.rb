require 'rest-client'
class Reservation < ActiveRecord::Base
  URL = "http://45.79.165.248:8080/"
  belongs_to :customers
  before_save :check_if_valid_date_range # lets see if this is correct
  before_save :no_larger_than_week
  validates_presence_of :start
  validates_presence_of :finish
  validates_presence_of :customer_id

  # need to enable pricing
  has_one :price, as: :item, through: :products

  # TODO: Test this
  def hours
    (finish - start) / (60 * 60) # ruby things
  end

  # Test
  def calculate_cost(price_in_pennies)
    (price_in_pennies * hours).to_i / 100
  end

  class << self
    def remote_space_check(reservation)
      # for the final project, we need to make this connection secure
      response = RestClient.get "#{URL}/api/garage/b/checkreservation", accept: :json, params: {
        start: reservation.start, 
        finish: reservation.finish 
      }
      outcome = response.to_s

      #return false unless outcome # can't use this when no access to the internet
      return 'true' == outcome
    end

    # save a space in the garage
    def remote_reserve_space(res)
      response = RestClient.get "#{URL}/api/garage/b/setreservation", accept: :json, params: {
        start: res.start,
        finish: res.finish
      }

      # return false if the outcome is false
      # I would prefer if the "REST api" was an actual
      # "REST api" and returned something a little more
      # that a simple boolean... but what ever...
      #return false unless outcome # can't use this when no access to the internet
      return response.to_s == 'true'
    end

    # This code is not implemented in the garage system.
    # not sure if berrykerry implemented it.
    def remote_remove(reservation)
      return true
    end
  end

  private
    def check_if_valid_date_range
      finish > start
    end
    
  def no_larger_than_week
    range = finish - start
    range > 1.week
  end
    
  def reserve_in_garage
    if(@start < DateTime.now.to_s)
           # format.html { redirect_to @reserve_in_garage, notice: 'Start has to greater than current time.' }
      return false
    end
    
    if(@start > @finish)  
     # format.html { redirect_to @reserve_in_garage, notice: 'Start has to be before finish.' }
      return false # print some error ? 
    end
    return true
  end

end
