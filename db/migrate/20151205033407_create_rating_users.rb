class CreateRatingUsers < ActiveRecord::Migration
  def change
    create_table :rating_users do |t|
      t.integer :rating
      t.string :comment
      t.integer :rated_user_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
