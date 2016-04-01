class Price < ActiveRecord::Base
  before_save :check_if_zero

  validates_presence_of :pennies

  def dollars
    pennies / 100.0
  end

  private

  def check_if_zero
    pennies != 0
  end

end
