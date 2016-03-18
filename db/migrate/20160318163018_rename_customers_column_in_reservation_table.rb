class RenameCustomersColumnInReservationTable < ActiveRecord::Migration
  def change
    rename_column :reservations, :customers_id, :customer_id
  end
end
