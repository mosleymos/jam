class ConversationsController < ApplicationController

	def new
	end

	def create
		@conversation = Conversation.create!
		redirect_to action: 'index'
	end

	def indexp
		@conversations = current_user.mailbox.inbox
	end

	def show
	end
end
