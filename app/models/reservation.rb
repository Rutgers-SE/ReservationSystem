class Reservation < ActiveRecord::Base
  belongs_to :customers
end
