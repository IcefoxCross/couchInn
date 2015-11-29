class Reservation < ActiveRecord::Base

	belongs_to :user
	belongs_to :couch

	# Retorna las reservas confirmadas
	scope :confirmed, -> { where(confirmed: true) }

	validate :consistent_dates
  validate :free_couch

  private
  def consistent_dates
    #chequea que la fecha inicial sea a futuro
    if (self.start_date <= Date.current)
      errors.add(:start_date, '^ La Fecha de Inicio tiene que ser mayor a la fecha actual.')
    end
    #chequea que la fecha inicial entre en el rango
    if (self.start_date < self.couch.dateBegin || self.start_date > self.couch.dateEnd)
      errors.add(:start_date, '^ La Fecha de Inicio no esta en el rango disponible.')
    end
    #chequea que la fecha final sea mayor que la inicial
    if (self.start_date >= self.end_date)
      errors.add(:end_date, '^ La Fecha de Inicio tiene que ser menor a la Fecha Final.')
    end
    #chequea que la fecha final entre en el rango
    if (self.end_date < self.couch.dateBegin || self.end_date > self.couch.dateEnd)
      errors.add(:end_date, '^ La Fecha de Final no esta en el rango disponible.')
    end
  end

  def free_couch
    #verifica que el coucheste disponible entre las fechas
    errors.add(:couch_id, '^ En este periodo el couch ya se encuentra reservado.') if !self.couch.is_free?(self.start_date, self.end_date) 
  end

end
