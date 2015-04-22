require 'rails_helper'
require 'user'

describe User do

	it 'should have a customer role' do
		@user = User.new
		@user.role.should == 'customer'
	end


end