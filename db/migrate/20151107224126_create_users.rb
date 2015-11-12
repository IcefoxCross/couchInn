class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastName
      t.string :email
      t.string :password
      t.boolean :admin
      t.boolean :premium

      t.timestamps null: false
    end
  end
end
