class RegistrationsController < Devise::RegistrationsController
 
    
    
    

    def create
  @user = User.new(params[:user])
  if @user.save
    if params[:user][:avatar].blank?
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => "crop"
    end
  else
    render :action => 'new'
  end
end

def update
  @user = User.find(current_user.id)
  if @user.update_attributes(params[:user])
    if params[:user][:avatar].blank?
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => "crop"
    end
  else
    render :action => 'edit'
  end
end

protected
    def after_update_path_for(user)
      if user.role=="Student"
    	student_index_path
 	else
 	    quizzes_path
    end
    end


end 