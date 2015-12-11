class Prem < ActiveRecord::Base
    belongs_to :user
     validates :card_number, :numericality => {:only_integer => true}
    validates :card_security_number, :numericality => {:only_integer => true}
    
    # always include the lower boundary for semi open intervals
   filterrific(
        available_filters: [
        :created_at_gte,
        :created_at_lt
        ]
  )
    scope :created_at_gte, lambda { |reference_time|
        where('prems.created_at >= ?', reference_time)
    }

    # always exclude the upper boundary for semi open intervals
    scope :created_at_lt, lambda { |reference_time|
        where('prems.created_at < ?', reference_time)
    }
end