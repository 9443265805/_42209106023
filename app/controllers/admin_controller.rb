class AdminController < ApplicationController

def assignquestions
   session[:quiz_id]=params[:quiz_id]
   @quizquestions=Question.where(:quiz_id=> session[:quiz_id])
   @generalquestions=Question.where(:quiz_id=>nil)
   @quizname=Quiz.find(session[:quiz_id]).quizname

end

def markquestions
	
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




end
