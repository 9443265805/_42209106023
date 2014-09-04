class AdminController < ApplicationController

	before_filter :authenticate_admin

	def assignquestions
	   session[:quiz_id]=params[:quiz_id]
	   @quizquestions=Question.where(:quiz_id=> session[:quiz_id])
	   @generalquestions=Question.where(:quiz_id=>nil).paginate(:page => params[:page], :per_page => 10)		
	   @quizname=Quiz.find(session[:quiz_id]).quizname
	end

	def markquestions
		unless params[:generalquestion_ids].nil?
			quizquestions_count=Question.where(:quiz_id=> session[:quiz_id]).count
			markquestions_count=params[:generalquestion_ids].count
			if quizquestions_count + markquestions_count > 10 
				redirect_to :back , notice: "Only 10 questions can be added to the quiz"
			else 
				Question.update_all(["quiz_id=?",session[:quiz_id]], :id => params[:generalquestion_ids])
				@quiz=Quiz.find(session[:quiz_id])
				quizquestions_count=Question.where(:quiz_id=> session[:quiz_id]).count
				if quizquestions_count == 10 
					@quiz.status="Completed"
				else
					@quiz.status="Not Completed"
				end
				@quiz.count=quizquestions_count
				@quiz.save
				redirect_to :back
			end
		else
			redirect_to :back,notice: "No questions selected"
		end
	end

	def unmarkquestions
		Question.update_all(["quiz_id=?", nil], :id => params[:question_ids])
		@quiz=Quiz.find(session[:quiz_id])
		@quiz.count=Question.where(:quiz_id=> session[:quiz_id]).count
		if @quiz.count == 10 
			@quiz.status="Completed"
		else
			@quiz.status="Not Completed"
		end
		@quiz.save
		redirect_to :back
	end



	def authenticate_admin
		unless current_user.role=="Admin"
			if current_user.role=="Teacher" 
				redirect_to quizzes_path,notice: "you dont have the permission to see this page"	
			elsif current_user.role=="Student" 
				redirect_to student_index_path,notice: "you dont have the permission to see this page"	
			end
		end
	end

end
