class Quiz < ActiveRecord::Base
  attr_accessible :starttime, :endtime, :quizname, :date, :category
	
	validates_presence_of :starttime, :endtime ,:quizname ,:date

	validate  :valid_duration, :valid_date, :valid_starttime

	def valid_date
		if date < Date.today
            self.errors.add :base, ("Date cannot be before the current date")
        end
    end
    
    def valid_starttime
    	
    	if starttime.hour < Time.now.hour 
		self.errors.add :base, ("Start time cannot be before current time")
		end
	end

	def valid_duration
		if endtime - starttime < 900  
			self.errors.add :base, ("Duration should be greater than  or equal to 15 minutes ")
		end
	end
  has_many :questions

 
end
