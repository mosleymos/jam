class User < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: true
	validates :pseudo, presence: true, length: { maximum: 25 }
	validates :age, presence: true
	# validates :sexe, presence: true, inclusion: { in: %w(masculin feminin autre)}
	validates :ville, presence: true
end