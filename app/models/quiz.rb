class Quiz < ActiveRecord::Base
  attr_accessible :starttime, :endtime, :quizname, :date, :category
	
	validates_presence_of :starttime, :endtime ,:quizname ,:date

	validate  :valid_duration

	def valid_duration
		if endtime - starttime < 900  
			self.errors.add :base, ("Duration should be greater than  or equal to 15 minutes ")
		end
	end
  has_many :questions

 
end
