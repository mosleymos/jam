require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	def setup
		@user=User.new( { email:"bob@example.com", pseudo:"bob", age:18, sexe:"masculin", ville:"Paris"} )
	end

	def test_presence_email
		@user.email =" "
		assert !@user.save, "Saved the user without an email"
	end

	def test_mauvais_format_email
		badmail = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
		badmail.each do |m|
			@user.email=m
			assert !@user.save, "Mauvais format : pas une adresse mail"
		end	
	end	

	def test_bon_format_email
		goodmail = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
		goodmail.each do |b|
			@user.email=b
			assert @user.save, "format d'email correct"
		end	
	end	

	def test_presence_pseudo
		@user.pseudo =" "
		assert !@user.save, "Saved the user without a pseudo"
	end

	def test_email_unique
		user_with_same_email = @user.dup
		@user.save
        assert !user_with_same_email.save, "email déjà utilisé" 
	end

	def test_longueur_pseudo
		@user.pseudo = "a"*26
		assert !@user.save, "pseudo trop long"
	end	

	def test_presence_age
		@user.age =" "
		assert !@user.save, "Saved the user without an age"
	end

	def test_presence_sexe
		@user.sexe =" "
		assert !@user.save, "Saved the user without a sexe"
	end

	def test_presence_ville
		@user.ville =" "
		assert !@user.save, "Saved the user without a city"
	end

end
