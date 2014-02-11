class ConversationsController < ApplicationController

	def new
	end

	def create
		@conversation = Conversation.create!
		redirect_to action: 'index'
	end

	def index
	end

	def show
		@conversation = Conversation.find(params[:id])
	end
end
