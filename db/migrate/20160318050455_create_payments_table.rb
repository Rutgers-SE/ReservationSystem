class CreatePaymentsTable < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :pennies, default: 0, null: false
      t.timestamps null: false
    end

    create_table :products do |t|
      t.belongs_to :item, index: true
      t.belongs_to :price, index: true
      t.string :purchase_type, default: "one-time", null: false
      t.timestamps null: false
    end

  end
end
