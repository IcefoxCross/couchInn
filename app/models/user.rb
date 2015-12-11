class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :couch, dependent: :destroy
	has_many :reservations, dependent: :destroy
	has_many :questions
	has_many :rating_couches
	has_many :rating_users
    has_many :prems

	validate :edad_minima
   # always include the lower boundary for semi open intervals
    filterrific(
        available_filters: [
        :created_at_gte,
        :created_at_lt
        ]
  )
    scope :created_at_gte, lambda { |reference_time|
        where('users.created_at >= ?', reference_time)
    }

    # always exclude the upper boundary for semi open intervals
    scope :created_at_lt, lambda { |reference_time|
        where('users.created_at < ?', reference_time)
    }
    
	#validate :tarjeta

	def get_age
		d = Date.today.year - self.age.year
		(Date.today < self.age + d.years) ? d-1 : d
	end

	def edad_minima
		errors.add(:age, "Tenes que tener como minimo 18 años de edad para usar el servicio.") if self.get_age < 18
	end
	
   # def tarjeta
   #     errors.add(:card_number, "Numero de tarjeta invalido.") if self.card_number.to_s.length < 16
   #     errors.add(:card_security_number, "Numero de seguridad invalido.")if self.card_security_number.to_s.length < 4
   # end
end
