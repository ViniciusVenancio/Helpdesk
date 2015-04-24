require "rails_helper"

describe Ticket do
	let(:ticket) { Ticket.create(subject: 'Problema HD') }
	let(:user) { User.new(first_name: "Pedro", last_name: "Alcantra", email: "pedro_alcantra@hotmail.com") }

	it "should have an user" do
		ticket.user = user
		expect(ticket.user).not_to be_nil
	end

	it "must have the default priority" do
		ticket.save
		expect(ticket.errors[:priority].length).to be == 0
	end

	it "must have the valid priority" do
		ticket.priority = "none"
		ticket.save
		expect(ticket.errors[:priority].length).to be > 0
	end
end