class CambiarTiposFechas < ActiveRecord::Migration
  def change
  	change_column :couches, :dateBegin, :date
  	change_column :couches, :dateEnd, :date
  end
end
