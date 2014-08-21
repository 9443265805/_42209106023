class StudentController < ApplicationController

	def index
		@studentquizlist=StudentQuizResult.where(user_id: current_user.id )
	end

	def startquiz
		session[:quiz_id]=params[:quiz_id]
		@questions=Quiz.find(session[:quiz_id]).questions
	end

	def endquiz
		@score=0
		for question in Quiz.find(session[:quiz_id]).questions
			if params["answers_#{question.id}"]== question.answer
				@score=@score+10
			end
		end
		StudentQuizResult.where(quiz_id: session[:quiz_id] ,user_id: current_user.id).first.update_attributes(:score=>@score)

	end


end
