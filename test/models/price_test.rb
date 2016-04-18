require 'test_helper'

class PriceTest < ActiveSupport::TestCase

    test "cannot create price without a number... duh" do 
        price = Price.new
        assert_not price.save
    end
    
    test "created awesomely" do
        price = Price.new pennies: 500
        assert price.save
    end
    
    test "converts pennies to dollars" do
        price = Price.new pennies: 500
        assert (5.00 == price.dollars)
    end


end

## http://guides.rubyonrails.org/testing.html#unit-testing-your-models