class ContractType < ActiveRecord::Base
	has_many :services
	has_many :contracts

	validates :name, presence: true
	validates :description, presence: true
	validates :value, presence: true
	validates :value_type, presence: true
end