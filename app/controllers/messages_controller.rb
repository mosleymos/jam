class MessagesController < ApplicationController

	def new
		@users = User.all
	end

	def create
		destinataire = User.find(params[:id])
		@subject = params[:subject]
		@message = params[:message]	
		current_user.send_message(destinataire, "#{@message}", "#{@subject}")
		notification = Notification.last
		redirect_to conversation_path(notification.conversation_id)
	end

	def show
		@message = Receipt.find(params[:id])	
	end

end
