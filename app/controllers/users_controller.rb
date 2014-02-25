class UsersController < ApplicationController

	before_filter :authenticate_user!

	def new
		@user = User.new
	end

	def index
		# @user = User.all
		@q = User.search(params[:q])
  		@user = @q.result(distinct: true)
	end
		
	def create
	 	@user = User.create(user_params)
	end

	def show
		@user = User.find(params[:id])
		@micropost = current_user.microposts.build
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		flash[:success] = "Profile updated"
		redirect_to @user
	end
		
	def destroy
		@user = current_user
		@user.destroy
		redirect_to new_user_session_path
	end

	def data
		@user = current_user
	end	

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def user_params
	  params.require(:user).permit(:avatar, :age, :sexe, :orientation, :ville, :cheveux, :yeux, 
	  	:taille, :bodytype, :profession, :religion, :astral, :annonce)
	end	

end
