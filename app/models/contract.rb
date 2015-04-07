class Contract < ActiveRecord::Base
	belongs_to :enterprise
	self.inheritance_column = nil
end