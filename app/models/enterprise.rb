class Enterprise < ActiveRecord::Base
	belongs_to :user
	has_many :contracts
	has_many :tickets
end