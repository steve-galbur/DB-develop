class CreateBookOrders < ActiveRecord::Migration[4.2]
  def change
    create_table :books_orders do |t|
      t.references :order, foreign_key: true
      t.references :book, foreign_key: true
    end
  end
end
