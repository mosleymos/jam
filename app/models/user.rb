class User < ActiveRecord::Base

	has_many :microposts, dependent: :destroy
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: true
	validates :name, presence: true, length: { maximum: 25 }
	validates :age, presence: true
	# validates :sexe, presence: true, inclusion: { in: %w(masculin feminin autre)}
	validates :ville, presence: true

	# gestion de la prise de contact, mise en relation
	has_many :targetships
	has_many :targets, :through => :targetships, 
				:conditions => "status = 'accepted'"
	has_many :requested_targets, :through => :targetships, :source => :target,
				:conditions => "status = 'requested'"
	has_many :pending_targets, :through => :targetships, :source => :target,
				:conditions => "status = 'pending'"

	# flux de statuts sur la home page 

	def feed

		feed=[]
		User.find_each do |u|
			if u.microposts.any?
				feed << u.microposts.first
			end		
		end
		return feed.sort! { |a,b| b.created_at <=> a.created_at }

	end

	# devise
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
 	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    #paperclip
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/	

	#particularités de mailboxer 

	acts_as_messageable
	
	#Returning any kind of identification you want for the model
	# def name
	# end

	#Returning the email address of the model if an email should be sent for this object (Message or Notification).
	#If no mail has to be sent, return nil.
	def mailboxer_email(object)
	  #Check if an email should be sent for that object
	  #if true
	  return "define_email@on_your.model"
	  #if false
	  #return nil
	end
end