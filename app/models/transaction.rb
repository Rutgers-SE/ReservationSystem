class Transaction < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :price
  belongs_to :customer
end
