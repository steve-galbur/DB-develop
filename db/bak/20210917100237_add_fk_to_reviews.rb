class AddFkToReviews < ActiveRecord::Migration[4.2]
  def change
    add_foreign_key :reviews, :customers, column: :customer_id, primary_key: :"id", on_delete: :cascade
    add_foreign_key :reviews, :books, column: :book_id, primary_key: :"id", on_delete: :cascade
  end
end
