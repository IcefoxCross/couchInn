class AgregarEdadAUsuario < ActiveRecord::Migration
  def change
  	add_column :users, :age, :date
  end
end
