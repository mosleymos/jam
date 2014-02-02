require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	def setup
		@user=User.new( { email:"bob@example.com", pseudo:"bob", age:18, sexe:"masculin", ville:"Paris"} )
	end

	test "presence_email" do
		@user.email =" "
		assert !@user.save, "Saved the user without an email"
	end

	test "mauvais_format_email" do
		badmail = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
		badmail.each do |m|
			@user.email=m
			assert !@user.save, "Mauvais format : pas une adresse mail"
		end	
	end	

	test "bon_format_email" do
		goodmail = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
		goodmail.each do |b|
			@user.email=b
			assert @user.save, "format d'email correct"
		end	
	end	

	test "presence_pseudo" do
		@user.pseudo =" "
		assert !@user.save, "Saved the user without a pseudo"
	end

	test "email_unique" do
		user_with_same_email = @user.dup
		@user.save
        assert !user_with_same_email.save, "email déjà utilisé" 
	end

	test "longueur_pseudo" do
		@user.pseudo = "a"*26
		assert !@user.save, "pseudo trop long"
	end	

	test "presence_age" do
		@user.age =" "
		assert !@user.save, "Saved the user without an age"
	end

	test "presence_sexe" do
		@user.sexe =" "
		assert !@user.save, "Saved the user without a sexe"
	end

	test "presence_ville" do
		@user.ville =" "
		assert !@user.save, "Saved the user without a city"
	end

	# test "bon type de sexe" do
	# 	assert_block do
	# 		["masculin", "feminin", "autre"].any? {|b| @user.sexe == b }
	# 	end
	# end

end
