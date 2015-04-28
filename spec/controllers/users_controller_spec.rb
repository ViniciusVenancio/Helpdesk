require "rails_helper"

describe UsersController do
	let(:user) { User.all }

	describe "GET #index" do
	
		context "show all users" do
			example do
				get :index
				response.should redirect_to users_path
			end
		end
	end
	
end