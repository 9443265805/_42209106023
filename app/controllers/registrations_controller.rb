class RegistrationsController < Devise::RegistrationsController
 protected

    def after_update_path_for(user)
      if user.role=="Student"
    	student_index_path
 	else
 	    quizzes_path
    end
    end
end 