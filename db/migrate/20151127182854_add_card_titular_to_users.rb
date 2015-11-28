class AddCardTitularToUsers < ActiveRecord::Migration
  def change
    add_column :users, :card_titular, :string
  end
end
