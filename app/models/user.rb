class User < ActiveRecord::Base

	# devise
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
 	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         #paperclip
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
	# mailboxer
	acts_as_messageable

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: true
	validates :name, presence: true, length: { maximum: 25 }
	validates :age, presence: true
	# validates :sexe, presence: true, inclusion: { in: %w(masculin feminin autre)}
	validates :ville, presence: true
end