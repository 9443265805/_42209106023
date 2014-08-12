class QuestionsController < ApplicationController


	def index 
	@questions=Question.all
	end 

	def new
	@question=Question.new
	end
	def create 
	@question=Question.new(params[:question])	
	if @question.save
		redirect_to @question,notice: 'Question successfully saved'
	else 
		render action: "new"
	end
	end
	def show
		@question=Question.find(params[:id])
	end 
	def edit
	@question=Question.find(params[:id])
	end
	def update
	@question=Question.find(params[:id])

	if @question.update_attributes(params[:question])
		redirect_to @question
	else
		render action: "edit"
	end
	end

	def destroy
	@question = Question.find(params[:id])
	@question.destroy

	redirect_to action: "index"
	end 

end
