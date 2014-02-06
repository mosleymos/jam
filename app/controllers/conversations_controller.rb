class ConversationsController < ApplicationController

	def new
	end

	def index
		@conversations = current_user.mailbox.inbox
		@user = User.all
	end

	def show
	end
end
