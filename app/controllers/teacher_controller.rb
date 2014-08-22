class TeacherController < ApplicationController

	before_filter :authenticate_student!

	def assignstudents
		session[:quiz_id]=params[:quiz_id]
		@students=User.where(role: 'Student')
		@markedstudents=[]
		StudentQuizResult.where(quiz_id: session[:quiz_id]).each {|p| @markedstudents.push(p.user)}
	end

	def markstudents
		unless params[:generalstudent_ids].nil?
			studentsadded=[]
			for id in params[:generalstudent_ids]
				if 	 StudentQuizResult.where(quiz_id: session[:quiz_id],user_id: id).count > 0
					studentsadded.push(User.find(id).name)
				else
					StudentQuizResult.create do |u|
	  				u.quiz_id = session[:quiz_id]
	  				u.user_id=id
	  				end
	  			end
			end
			flashmessage=studentsadded.join(",")+"already added" if studentsadded.count > 0
			redirect_to :back,notice: flashmessage
		else
			redirect_to :back,notice: "No Students Selected"
		end
	end

	def unmarkstudents
		StudentQuizResult.delete_all(quiz_id: session[:quiz_id],user_id: params[:markedstudent_ids])
		redirect_to :back
	end

	def authenticate_student!
		if current_user.role=="Student"
			redirect_to student_index_path,notice: "you dont have the permission to see this page"	
		end
	end
end
