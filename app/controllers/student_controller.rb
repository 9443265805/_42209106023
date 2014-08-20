class StudentController < ApplicationController

	def index
		@studentquizlist=StudentQuizResult.where(user_id: current_user.id )
	end

	def startquiz
		session[:quiz_id]=params[:quiz_id]
		@questions=Quiz.find(session[:quiz_id]).questions
	end


end
