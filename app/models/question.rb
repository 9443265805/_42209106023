class Question < ActiveRecord::Base
  attr_accessible :answer, :option1, :option2, :option3, :option4, :question_text, :category

   belongs_to :quiz

   validates_presence_of :answer, :option1, :option2, :option3, :option4, :question_text

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |question|
      csv << question.attributes.values_at(*column_names)
    end
  end
end

def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      question_hash = row.to_hash 
      question = Question.where(id: question_hash["id"])

      if question.count == 1
        question=question.first
        question.update_attributes(:question_text => question.question_text,:answer => question.answer,:category => question.category,:option1 => question.option1,:option2 => question.option2,:option3 => question.option3,:option4 => question.option4)
      else
        Question.create!(:question_text => question_hash["question_text"],:answer => question_hash["answer"],:category => question_hash["category"],:option1 => question_hash["option1"],:option2 => question_hash["option2"],:option3 => question_hash["option3"],:option4 => question_hash["option4"])
      end # end if !question.nil?
    end # end CSV.foreach
  end # end self.import(file)


end
