class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: true
	validates :pseudo, presence: true, length: { maximum: 25 }
	validates :age, presence: true
	validates :sexe, presence: true
	validates :ville, presence: true
end