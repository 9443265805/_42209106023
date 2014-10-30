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

end
