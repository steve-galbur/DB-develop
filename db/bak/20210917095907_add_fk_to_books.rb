class AddFkToBooks < ActiveRecord::Migration[4.2]
  def change
    add_foreign_key :books, :suppliers, column: :supplier_id, primary_key: :"id", on_delete: :cascade
    add_foreign_key :books, :authors, column: :author_id, primary_key: :"id", on_delete: :cascade
  end
end
