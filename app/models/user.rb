class User < ActiveRecord::Base
	has_many :couch, dependent: :destroy
end
