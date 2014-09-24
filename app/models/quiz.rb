class Quiz < ActiveRecord::Base
  attr_accessible :starttime, :endtime, :quizname, :date, :category ,:questioncount ,:status
	
	validates_presence_of :starttime, :endtime ,:quizname 

	validate  :valid_duration,  :valid_starttime

	
    
    def valid_starttime
    	
    	if starttime.hour < Time.now.hour # + 2
		self.errors.add :base, ("Minimun Start time hour  is two hour after the current hour ")
		end
	
	end

	def valid_duration
		if endtime - starttime < 900  
			self.errors.add :base, ("Duration should be greater than  or equal to 15 minutes ")
		end
	end
  has_many :questions

 
end
