class CreateCouches < ActiveRecord::Migration
  def change
    create_table :couches do |t|
      t.string :name
      t.integer :type_id
      t.integer :user_id
      t.string :description
      t.string :location
      t.datetime :dateBegin
      t.datetime :dateEnd
      t.integer :maxHosts
      t.string :image

      t.timestamps null: false
    end
  end
end
