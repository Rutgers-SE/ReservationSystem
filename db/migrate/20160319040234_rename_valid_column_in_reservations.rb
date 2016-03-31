class RenameValidColumnInReservations < ActiveRecord::Migration
  def change
    rename_column :reservations, :valid, :is_validated
  end
end
