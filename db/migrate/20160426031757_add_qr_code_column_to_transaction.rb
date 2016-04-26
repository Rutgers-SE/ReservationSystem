class AddQrCodeColumnToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :qr_seed, :string, :null => false, default: ""
  end
end
