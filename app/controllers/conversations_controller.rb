class ConversationsController < ApplicationController

	def new
	end

	def create
		@conversation = Conversation.create!
		redirect_to action: 'index'
	end

	def index
		if current_user.mailbox.conversations.any?
		@conversations = current_user.mailbox.conversations
		end
	end	

	def show
		@conversation = Conversation.find(params[:id])
		@target = @conversation.recipients.find { |u| u!=current_user}
	end

	def reply
		conversation=Conversation.find(params[:id])
		@message = params[:message]
		current_user.reply_to_conversation(conversation, "#{@message}")
		redirect_to conversation_path(params[:id])
	end
end
