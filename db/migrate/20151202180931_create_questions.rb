class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :ask
      t.string :answer
      t.integer :couch_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
