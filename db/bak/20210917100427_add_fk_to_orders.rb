class AddFkToOrders < ActiveRecord::Migration[4.2]
  def change
    add_foreign_key :orders, :customers, column: :customer_id, primary_key: :"id", on_delete: :cascade
  end
end
