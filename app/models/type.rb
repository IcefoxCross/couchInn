class Type < ActiveRecord::Base
	has_many :couch
	
	validates_uniqueness_of :name, :case_sensitive => false
end
