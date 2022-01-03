class CreateAppointments < ActiveRecord::Migration[4.2]
  def change
    create_table :appointments do |t|
      t.references :status, foreign_key: true
      t.references :physician, foreign_key: true
      t.references :patient, foreign_key: true
      t.timestamps
    end

    # add_foreign_key :appointments, :statuses, column: :status_id, primary_key: :"id", on_delete: :cascade
    #add_foreign_key :appointments, :physicians, column: :physician_id, primary_key: :"id", on_delete: :cascade
    # add_foreign_key :appointments, :patients, column: :patient_id, primary_key: :"id", on_delete: :cascade
  end
end
