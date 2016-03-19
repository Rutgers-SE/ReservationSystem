class Price < ActiveRecord::Base
  has_many :items, through: :products
end
