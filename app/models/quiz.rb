class Quiz < ActiveRecord::Base
  attr_accessible :starttime, :endtime, :quizname, :date, :category
	
	#validates_presence_of :starttime, :endtime ,:quizname ,:date


  has_many :questions
end
