
class ApplicationController < ActionController::Base
  protect_from_forgery
before_filter :authenticate_user!

 def after_sign_in_path_for(user)
    if user.role=="Student"
    	student_index_path
 	else
 	    quizzes_path
    end
 end

 def after_sign_out_path_for(user)
    new_user_session_path
 end
  

end
