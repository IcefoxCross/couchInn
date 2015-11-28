class RemoveCardNumberToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :card_number, :integer
  end
end
