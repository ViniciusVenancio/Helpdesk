class Contract < ActiveRecord::Base
	belongs_to :enterprise
	belongs_to :contract_type
	has_many :amendments

	validates :contract_type_id, presence: true
	validates :enterprise_id, presence: true
	validates :start_date, presence: true
	validates :due_date, presence: true
	validates :monthly_payment, presence: true
	validates :sla, presence:true
	validates :status, presence:true
end