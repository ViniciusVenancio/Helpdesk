require "rails_helper"

describe Ticket do
	let(:ticket) { Ticket.new(subject: 'Problema HD') }
	let(:user) { User.new(first_name: "Pedro", last_name: "Alcantra", email: "pedro_alcantra@hotmail.com") }

	it "should have an user" do
		user.save!
		ticket.user = user
		expect(ticket.user).not_to be_nil
	end

	it "must have a password" do
	end
end