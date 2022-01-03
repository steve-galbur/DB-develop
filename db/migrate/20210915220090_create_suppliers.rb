class CreateSuppliers < ActiveRecord::Migration[4.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.timestamps
    end
  end
end
