require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	test "route pour l'affichage d'un user" do
	    assert_routing '/users/1', {controller: "users", action: "show", id: "1"}
	end

	# test de la page de profil (action show du controller)


end
