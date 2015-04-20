class Service < ActiveRecord::Base
	belongs_to :contract_type

	validates :name, presence: true
	validates :description, presence: true
	validates :category, presence: true
	validates :contract_type_id, presence: true
end