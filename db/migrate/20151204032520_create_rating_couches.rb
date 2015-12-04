class CreateRatingCouches < ActiveRecord::Migration
  def change
    create_table :rating_couches do |t|
      t.integer :rating
      t.string :comment
      t.integer :couch_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
