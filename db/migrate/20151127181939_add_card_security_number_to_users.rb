class AddCardSecurityNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :card_security_number, :integer
  end
end
