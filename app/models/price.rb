class Price < ActiveRecord::Base
  has_many :items, throught: :products
end
