class Couch < ActiveRecord::Base
	
	belongs_to :type
	belongs_to :user
	has_many :reservations, dependent: :destroy

	# Recibe un usuario como parámetro y retorna 
  	# si es dueño del couch
	def is_owner?(user)
		return (self.user == user)
	end

	# Recibe como parámetros las fechas en las que se busca 
  	# que esté libre el couch
  	def is_free?(from, to)
    	reservas_del_couch = self.reservations # reservas del couch (por el has_many)
    	reservas_confirmadas = reservas_del_couch.confirmed # solo miramos las confirmadas
	    reservas_confirmadas = reservas_confirmadas.where('? < end_date', from) # from se copiaría en el lugar de '?'
	    reservas_confirmadas = reservas_confirmadas.where('? > start_date', to) # to se copiaría en el lugar de '?'
    
	    # Retorno true o false si el resultado de lo anterior 
	    # está vacío o no
	    return reservas_confirmadas.empty?
  	end

  	# Retorna los couches que están libres entre 2 fechas
  	# Por una cuestión de simplicidad se realiza iterando sobre 
  	# sobre los couches
  	def self.free_couches(from, to)
    	result = [] # En result agregaremos los hospedajes libres
    	Couch.all.each do |couch|
      		result << couch if couch.is_free?(from, to) # Agregamos el hospedaje si está libre
    	end
  	end
end
