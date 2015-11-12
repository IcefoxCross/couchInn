class Type < ActiveRecord::Base
	has_many :couch
	
	validates_uniqueness_of :name, :case_sensitive => false
    before_destroy :type_change
    def type_change
        cs=self.couch
        t=::Type.first
        cs.each do |c|
            c.type=t
            c.save
        end
    end
end
