require 'test_helper'

class PagesStatiquesControllerTest < ActionController::TestCase

	test "intégration du layout sur la home" do
	  get :home
	  assert_template :home
	  assert_template layout: "layouts/application"
	end

	# tests des routes

	test "route vers a propos" do
		assert_routing '/apropos', {controller: "pages_statiques", action: "apropos"}
	end

	test "route vers mentions légales" do
		assert_routing '/mentionslegales', {controller: "pages_statiques", action: "mentionslegales"}
	end

end