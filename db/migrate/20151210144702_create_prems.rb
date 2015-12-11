class CreatePrems < ActiveRecord::Migration
  def change
    create_table :prems do |t|
      t.integer :monto
      t.integer :user_id
      t.string :card_number
      t.string :card_security_number

      t.timestamps null: false
    end
  end
end
