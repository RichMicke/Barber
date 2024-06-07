class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.references :customer, null: false, foreign_key: true
      t.string :service

      t.timestamps
    end
  end
end
