class Contract < ActiveRecord::Base
	# Associações
	belongs_to :enterprise
	belongs_to :contract_type

	# Validações
	validates :contract_type_id, presence: true
	validates :enterprise_id, presence: true
	validates :start_date, presence: true
	validates :due_date, presence: true
	validates :monthly_payment, presence: true
	validates :sla, presence:true
end