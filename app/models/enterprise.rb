require "cpf_cnpj"

class Enterprise < ActiveRecord::Base
	belongs_to :user 
	has_many :contracts
	has_many :tickets

	validates :name, presence: true
	validates :corporate_name, presence: true
	validates :phone, presence: true
	validates :cnpj, presence: true, uniqueness: true
	validates :state_registration, presence: true, uniqueness: true
	validates :adress, presence: true
	validates :number, presence: true
	validates :district, presence: true
	validates :city, presence: true
	validates :cep, presence: true
	validate :validates_cnpj

	def validates_cnpj
		errors.add("cnpj", "CNPJ inválido!") unless CNPJ.valid?(:cnpj)
	end

end