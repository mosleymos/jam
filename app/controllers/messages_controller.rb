class MessagesController < ApplicationController

	def new
		@users = User.all
	end

	def create
		@destinataire = User.find(params[:id])
		@message = params[:message]
		@subject = params[:subject]
		message = current_user.send_message(@destinataire, "#{@message}", "#{@subject}")
		redirect_to message_path(message.id)
	end	

	def show
		@message = Notification.find(params[:id])	
	end

end
