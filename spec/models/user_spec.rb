require "rails_helper"

describe User do
	let(:user) { User.new }

	it "contains the default role" do
		user.email = "vinicius.venancio@live.com"
		user.save!

		expect(user.role).to eql("customer")
	end

	it "must have a password" do
		expect(user.password).not_to be ''
	end
end