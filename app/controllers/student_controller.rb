class StudentController < ApplicationController
	before_filter :authenticate_student

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

	def authenticate_student
		unless current_user.role=="Student"
			redirect_to quizzes_path,notice: "you dont have the permission to see this page"	
		end
	end


end
