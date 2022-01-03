class CreatePatients < ActiveRecord::Migration[4.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
