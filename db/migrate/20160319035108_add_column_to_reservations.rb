class AddColumnToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :valid, :boolean, default: false, null: false
  end
end
