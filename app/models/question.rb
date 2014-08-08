class Question < ActiveRecord::Base
  attr_accessible :answer, :option1, :option2, :option3, :option4, :question_text

   belongs_to :quiz

end
