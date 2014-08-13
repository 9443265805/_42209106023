class QuizzesController < ApplicationController

def index 
@quizzes =Quiz.all
end 


def new 
@quiz=Quiz.new
end

def create
@quiz =Quiz.new(params[:quiz])


#if @quiz.endtime- @quiz.starttime >= 900
	if @quiz.save
	redirect_to @quiz
	else
	render action: "new"
	end
#else 
#@quiz.errors.add("Duration should be greater than or equal to 15 minutes")
#redirect_to :back 
#end
end
def show
	@quiz=Quiz.find(params[:id])
end

def edit
	@quiz=Quiz.find(params[:id])
end

def update
	@quiz=Quiz.find(params[:id])
	if @quiz.update_attributes(params[:quiz])
		redirect_to @quiz
	else
		render action: 'edit'
	end
end

def destroy
	@quiz=Quiz.find(params[:id])
	@quiz.destroy
	redirect_to quizzes_path
end

end