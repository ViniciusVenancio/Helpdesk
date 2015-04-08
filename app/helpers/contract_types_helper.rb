module ContractTypesHelper

	def format_package(package)
		case package
		when 'H' then 'Hora'	
		when 'D' then 'Dia'	
		when 'M' then 'Mês'
		when 'Y' then 'Ano'
		end
	end
end