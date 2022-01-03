class AddFkToBookOrders < ActiveRecord::Migration[4.2]
  def change
    add_foreign_key :books_orders, :orders, column: :order_id, primary_key: :"id", on_delete: :cascade
    add_foreign_key :books_orders, :books, column: :book_id, primary_key: :"id", on_delete: :cascade
  end
end
