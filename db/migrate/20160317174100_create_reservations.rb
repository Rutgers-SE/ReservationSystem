class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start
      t.datetime :finish
      t.references :customers, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
