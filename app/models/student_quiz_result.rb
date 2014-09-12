class StudentQuizResult < ActiveRecord::Base
   attr_accessible :score
   belongs_to :user
   belongs_to :quiz
end
