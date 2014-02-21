class Targetship < ActiveRecord::Base
	belongs_to :user
	belongs_to :target, :class_name => 'User', :foreign_key =>'target_id'

	validates :status, presence: true, inclusion: { in: %w(pending requested rejected accepted)}

	def self.exist? (user, target)
		not Targetship.find_by(user_id: user.id, target_id: target.id).nil?
	end

	def self.request(user, target)
	    unless user == target or Targetship.exist?(user, target)
	      transaction do
	        create(:user => user, :target => target, :status => 'pending')
	        create(:user => target, :target => user, :status => 'requested')
	      end
	    end
	end

	def self.accept(user, target)
	    transaction do
	      accepted_at = Time.now
	      accept_one_side(user, target, accepted_at)
	      accept_one_side(target, user, accepted_at)
	    end
	end

	def self.breakup(user, target)
	    transaction do
	      destroy(find_by_user_id_and_target_id(user, target))
	      destroy(find_by_user_id_and_target_id(target, user))
	    end
	end

private	

	def self.accept_one_side(user, target, accepted_at)
	    request = find_by_user_id_and_target_id(user, target)
	    request.status = 'accepted'
	    request.accepted_at = accepted_at
	    request.save!
	end	

end
