class TargetshipsController < ApplicationController



def create
  @targetship = current_user.targetships.build(:target_id => params[:target_id])
  if @targetship
    flash[:notice] = "Added friend."
    redirect_to user_path
  else
    flash[:notice] = "Unable to add friend."
    redirect_to root_url
  end
end


end
