class AvatarsController < ApplicationController
	 before_filter :authenticate_user!

def change_Avatar_Pic
	@user=current_user

@user.update_attributes(:avatar=>params[:avatar])
redirect_to  :back
end

end
