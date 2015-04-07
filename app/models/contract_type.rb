class ContractType < ActiveRecord::Base
	has_many :services
	has_many :contracts
end