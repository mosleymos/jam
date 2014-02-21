class TargetshipsController < ApplicationController

	def index
	end

	def create
	  @target=User.find(params[:target_id])
	  Targetship.request(current_user, @target)
	  flash[:notice] = "Demande de contact envoyée."
	  redirect_to(:back)
	end

	def accept
		@target=User.find(params[:target_id])
		if current_user.requested_targets.include?(@target)
			Targetship.accept(current_user, @target)
			flash[:notice] = "Vous êtes en contact avec #{@target.name}."
		else
			flash[:notice] = "Pas de demande de contact de #{@target.name}."
		end
		redirect_to(:back)
	end

	def decline
		@target=User.find(params[:target_id])
		if current_user.requested_targets.include?(@target)
			Targetship.breakup(current_user, target)
		else
			flash[:notice] = "Pas de demande de contact de #{@target.name}."
		end
		redirect_to(:back)
	end	

	def demandes_contact
	end

private

	def targetship_params
	  params.require(:targetship).permit(:status)
	end

end
