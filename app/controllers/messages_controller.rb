class MessagesController < ApplicationController

	def new
		@users = User.all
	end

	def create
		# if conversation.empty?
			destinataire = User.find(params[:id])
		# else
		# 	@destinataire = conversation.participants
		# end
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
