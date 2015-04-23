class Amendment < ActiveRecord::Base
	extend FriendlyId

	belongs_to :contract

	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :value, presence: true
	validates :title, presence: true
	validates_presence_of :slug

	friendly_id :amemdment_slug_enterpise, use: [:slugged, :history]

	def amemdment_slug_enterpise
		"of-#{self.contract.enterprise.corporate_name}"
	end

end