class StudentController < ApplicationController
	before_filter :authenticate_student

	def index
		@studentquizlist=StudentQuizResult.where(user_id: current_user.id )
	end

	def startquiz
		session[:quiz_id]=params[:quiz_id]
		time=Time.now
		@quiz=Quiz.find(session[:quiz_id])
		if @quiz.date != Date.today
		  redirect_to student_index_path,notice: "you cannot take the test today"
		else
             #endtime=@quiz.endtime
			 #endtime=endtime+(time.year - endtime.year).years + (time.month - endtime.month).months + (time.day - endtime.day).days
             #puts endtime -endtime.localtime
             #puts time
            # puts endtime - time 
			#if @quiz.endtime - @quiz.starttime > endtime - time
			if @quiz.starttime.hour >= time.hour && @quiz.endtime.hour <= time.hour  &&	@quiz.starttime.min <= time.min  && @quiz.endtime.min >= time.min 
				@questions=@quiz.questions

			else
				redirect_to student_index_path,notice: "you cannot take the test now"
			end
		end

	end

	def endquiz
		@score=0
		@quizname=Quiz.find(session[:quiz_id]).quizname
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
