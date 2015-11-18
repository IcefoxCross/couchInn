class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :couch, dependent: :destroy

	validates_inclusion_of :age,
		in: Date.new(1990)..Time.now.years_ago(18).to_date, 
		message: "Tenes que tener como minimo 18 años de edad para usar el servicio."

	def get_age
		d = Date.today.year - self.age.year
		(Date.today < self.age + d.years) ? d-1 : d
	end
end
