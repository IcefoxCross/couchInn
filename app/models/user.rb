class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :couch, dependent: :destroy
	has_many :reservations, dependent: :destroy

	validate :edad_minima

	def get_age
		d = Date.today.year - self.age.year
		(Date.today < self.age + d.years) ? d-1 : d
	end

	def edad_minima
		errors.add(:age, "Tenes que tener como minimo 18 años de edad para usar el servicio.") if self.get_age < 18
	end
end
