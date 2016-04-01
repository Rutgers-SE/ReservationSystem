require 'rqrcode'
class Transaction < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :price
  belongs_to :customer

  validates_presence_of :price
  validates_presence_of :customer
  validates_presence_of :reservation

  def generate_qr
    qrcode = RQRCode::QRCode.new("#{customer.email}-#{reservation.start.to_s}-#{reservation.finish.to_s}")
    qrcode.as_html
  end

  class << self
    def total_finalized
      where(finalized: true)
        .collect{|to, tr| to + tr.price.pennies}
    end

    def total_estimated
      all
        .collect{|to, tr| to + tr.price.pennies}
    end

    def percent_complete
      (total_finalized / total_estimated) * 100
    end
  end
end
