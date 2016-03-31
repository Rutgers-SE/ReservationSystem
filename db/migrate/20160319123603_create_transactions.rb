class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :reservation, index: true, foreign_key: true
      t.references :price, index: true, foreign_key: true
      t.string :charge_id

      t.timestamps null: false
    end
  end
end
