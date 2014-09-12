class Question < ActiveRecord::Base
  attr_accessible :answer, :option1, :option2, :option3, :option4, :question_text, :category

   belongs_to :quiz

   validates_presence_of :answer, :option1, :option2, :option3, :option4, :question_text

end
