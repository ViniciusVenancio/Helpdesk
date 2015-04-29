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
	validate :equal_date, :wrong_monthly_payment

	def equal_date
		errors.add("due_date", "data de vencimento igual a data de início!") unless self.start_date != self.due_date
	end

	def wrong_monthly_payment
		errors.add("monthly_payment", "Valor mensal inválido") unless self.monthly_payment > 0 && self.monthly_payment.is_a?(Numeric)
	end
end