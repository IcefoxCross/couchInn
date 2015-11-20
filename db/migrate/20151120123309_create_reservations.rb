class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.Date :start_date
      t.Date :end_date
      t.Boolean :confirmed

      t.timestamps null: false
    end
  end
end
