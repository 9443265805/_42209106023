class StudentMailer < ActionMailer::Base
  default from: "ethirajsrinivasan@gmail.com"
   def certificate_email(user,score,quizname)
    @user = user
    @score=score
    @quizname=quizname
    mail(to: @user.email, subject: 'Quiz Completion certificate')
  end

end
