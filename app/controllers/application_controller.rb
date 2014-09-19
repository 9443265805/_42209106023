
class ApplicationController < ActionController::Base
  protect_from_forgery
 before_filter :configure_permitted_parameters, if: :devise_controller?
 protected
 def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :name, :age, :email, :password, :password_confirmation, :remember_me, :role, :phonenumber , :school , :avatar) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :name, :age, :email, :role, :phonenumber , :password, :password_confirmation, :current_password , :school , :avatar) }
end

before_filter :authenticate_user!

def after_update_path_for(user)
    quizzes_path
    end

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
