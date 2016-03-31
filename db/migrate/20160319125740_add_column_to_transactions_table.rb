class AddColumnToTransactionsTable < ActiveRecord::Migration
  def change
    add_reference :transactions, :customer, index: true, foreign_key: true
  end
end
