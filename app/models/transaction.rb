require 'rqrcode'
class Transaction < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :price
  belongs_to :customer


  before_save :compile_qr_seed

  validates_presence_of :price
  validates_presence_of :customer
  validates_presence_of :reservation
  
  def compile_qr_seed
    self.qr_seed = qr_seed()
  end
  
  def qr_seed()
    "#{customer.email}-#{reservation.start.to_s}-#{reservation.finish.to_s}"
  end

  def generate_qr
    qrcode = RQRCode::QRCode.new qr_seed
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
    
    def valid_qr(res, code)
      trans = where(:qr_seed => code).first
      return false if trans.nil? 
      return false if trans.size > 1
      true
    end
  end
end
