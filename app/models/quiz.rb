class Quiz < ActiveRecord::Base
  attr_accessible :duration, :quizname

  has_many :questions
end
