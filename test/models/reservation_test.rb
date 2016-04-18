require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

    test "cannot create reservation without any information" do
        res = Reservation.new
        assert_not res.save
    end
    
    test "cannot create reservation without customer" do
        res = Reservation.new({
            :start => DateTime.now(),
            :finish => (DateTime.now() + 5.hours)
        })
        assert_not res.save
    end
    
    test "convert the date range to hours" do
        now = DateTime.now
        res = Reservation.new({
            :start => now,
            :finish => (now + 5.hours),
            :customer_id => 1 # this is fake
        })
        assert (res.hours == 5)
    end
    test "cannot save reservation if finish < start" do
        now = DateTime.now
        res = Reservation.new({
            :start => now,
            :finish => (now - 5.hours),
            :customer_id => 1 # this is fake
        })
        assert_not res.save
    end
     
end

## http://guides.rubyonrails.org/testing.html#unit-testing-your-models