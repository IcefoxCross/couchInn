class Question < ActiveRecord::Base

	belongs_to :user
	belongs_to :couch

	default_scope -> { order("created_at") }

end
