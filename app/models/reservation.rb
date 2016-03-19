require 'rest-client'
class Reservation < ActiveRecord::Base
  belongs_to :customers
  #
  # need to enable pricing
  has_one :price, as: :item, through: :products

  def hours
    (finish - start) / (60 * 60)
  end

  class << self
    def remote_reserve(reservation)
      #url = 'https://garagesyst-oufo.c9users.io'
      #response = RestClient.get "#{url}/api/garage/reserve", accept: :json, params: { start: reservation.start, finish: reservation.finish }
      #outcome = JSON.parse response.to_s

      #if outcome[:error]
        #return false
      #end

      return true

    end

    def remote_remove(reservation)
      return true
    end
  end

end
