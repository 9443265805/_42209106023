class ApplicationsearchController < ApplicationController

def searchcontent
@quizzes=Quiz.where(:quizname=>params[:searchable])
@questions=Question.where(:question_text=>params[:searchable])

end
end