class Contract < ActiveRecord::Base
	belongs_to :enterprise
	belongs_to :contract_type
	validates :contract_type_id, presence: true
end