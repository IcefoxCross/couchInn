class Reservation < ActiveRecord::Base

	belongs_to :user
  	belongs_to :couch
  
  	# Retorna las reservas confirmadas
  	scope :confirmed, -> { where(confirmed: true) }
end
