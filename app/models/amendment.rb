class Amendment < ActiveRecord::Base
	belongs_to :contract

	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :value, presence: true
	validates :title, presence: true
end