require "rails_helper"

describe User do
	let(:user) { User.new }

	it "contains the default role" do
		user.email = "vinicius.venancio@live.com"
		user.save!
		expect(user.role).to eql("customer")
	end

	it "should have a password" do
		expect(user.password).not_to be_empty
	end

	it "should have a valid email" do
		user.email = "adshausd.ausuahsd1"
		user.save
		expect(user.errors[:email].length).to be > 0
	end
end