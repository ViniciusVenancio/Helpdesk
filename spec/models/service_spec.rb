require "rails_helper"

describe Service do
	let(:service) { Service.new(name: "Web", description: "Testando", category: "Hardware") }
	let(:contract_type) { ContractType.new(name: "Hardware", description: "Hora", value: 80, value_type: "H") }

	it "contract should be not nil" do
		contract_type.save
		service.contract_type = contract_type
		service.save
		expect(service).to be_valid
	end
end