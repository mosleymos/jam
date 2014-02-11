class ConversationsController < ApplicationController

	def new
	end

	def create
		@conversation = Conversation.create!
		redirect_to action: 'index'
	end

	def index
		if current_user.mailbox.conversations.any?
		notification = Notification.find_by(params[:id])
		@conversation_id = notification.conversation_id
		end
	end	

	def show
		@conversation = Conversation.find(params[:id])
	end

	def reply
		conversation=Conversation.find_by(params[:id])
		@subject = params[:subject]
		@message = params[:message]
		current_user.reply_to_conversation(conversation, "#{@message}")
		notification = Notification.last
		redirect_to conversation_path(notification.conversation_id)
	end
end
