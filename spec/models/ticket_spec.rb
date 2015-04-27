require "rails_helper"

describe Ticket do
	let(:ticket) { FactoryGirl.create(:ticket) }
	let(:user) { User.new(first_name: "Pedro", last_name: "Alcantra", email: "pedro_alcantra@hotmail.com") }

	it "must have the valid priority" do
		ticket.priority = "none"
		ticket.save
		expect(ticket.errors[:priority].length).to be > 0
	end
end