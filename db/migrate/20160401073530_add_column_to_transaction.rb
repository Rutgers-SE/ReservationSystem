class AddColumnToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :finalized, :boolean, null: false, default: false
  end
end
