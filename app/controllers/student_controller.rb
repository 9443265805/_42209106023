class StudentController < ApplicationController
	before_filter :authenticate_student

	def index
		@studentquizlist=StudentQuizResult.where(user_id: current_user.id )
	end

	def startquiz
		
		#Prevent second attempt
		#if StudentQuizResult.where(quiz_id: session[:quiz_id] ,user_id: current_user.id).first.score?
        #redirect_to :back,notice: "you have already taken the test"
		#end


		session[:quiz_id]=params[:quiz_id]
		# local to UTC 
		
		time=Time.now.to_s(:db).to_time
		@quiz=Quiz.find(session[:quiz_id])
		if @quiz.date != Date.today
		  redirect_to student_index_path,notice: "you cannot take the test today"
		else
             # set to current date
             endtime=@quiz.endtime
			 endtime=endtime+(time.year - endtime.year).years + (time.month - endtime.month).months + (time.day - endtime.day).days
             starttime=@quiz.starttime
             starttime=starttime+(time.year - starttime.year).years + (time.month - starttime.month).months + (time.day - starttime.day).days
             #puts @quiz.endtime - @quiz.starttime
            if   time >= starttime && time <= endtime
				@questions=@quiz.questions
                @duration=endtime - time  
			else
				redirect_to student_index_path,notice: "you cannot take the test now"
			end
		end

	end

	def endquiz
		@user=current_user
		@score=0
		@quizname=Quiz.find(session[:quiz_id]).quizname
		for question in Quiz.find(session[:quiz_id]).questions
			if params["answers_#{question.id}"]== question.answer
				@score=@score+10
			end
		end
		StudentQuizResult.where(quiz_id: session[:quiz_id] ,user_id: current_user.id).first.update_attributes(:score => @score)
         #StudentMailer.certificate_email(@user,@score,@quizname).deliver
	end

	def authenticate_student
		unless current_user.role=="Student"
			redirect_to quizzes_path,notice: "you dont have the permission to see this page"	
		end
	end


end
