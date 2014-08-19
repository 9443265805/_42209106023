class TeacherController < ApplicationController

def assignstudents
@students=User.where(role: 'Student')
@markedstudents=[]
StudentQuizResult.where(quiz_id: '1').each {|p| @markedstudents.push(p.user)}
end

def markstudents
for id in params[:generalstudent_ids]
	StudentQuizResult.create do |u|
  u.quiz_id = "1"
  u.user_id=id
  end
end
redirect_to :back
end

def unmarkstudents
StudentQuizResult.delete_all(quiz_id: "1",user_id: params[:markedstudent_ids])
redirect_to :back
end

end
