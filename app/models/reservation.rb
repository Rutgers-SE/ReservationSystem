require 'rest-client'
class Reservation < ActiveRecord::Base
  URL = "http://45.79.165.248:8080/"
  belongs_to :customers

  validates_presence_of :start
  validates_presence_of :finished

  #
  # need to enable pricing
  has_one :price, as: :item, through: :products

  def hours
    (finish - start) / (60 * 60) # ruby things
  end

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
      outcome = JSON.parse response.to_s

      return false unless outcome
      return true

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
      return false unless outcome
      return return true
    end

    # This code is not implemented in the garage system.
    # not sure if berrykerry implemented it.
    def remote_remove(reservation)
      return true
    end
  end

end
