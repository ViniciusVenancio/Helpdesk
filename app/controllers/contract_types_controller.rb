class ContractTypesController < ApplicationController
  before_action :set_contract_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @contract_types = ContractType.all
    respond_with(@contract_types)
  end

  def show
    respond_with(@contract_type)
  end

  def new
    @contract_type = ContractType.new
    respond_with(@contract_type)
  end

  def edit
  end

  def create
    @contract_type = ContractType.new(contract_type_params)
    @contract_type.save
    respond_with(@contract_type)
  end

  def update
    @contract_type.update(contract_type_params)
    respond_with(@contract_type)
  end

  def destroy
    @contract_type.destroy
    respond_with(@contract_type)
  end

  private
    def set_contract_type
      @contract_type = ContractType.find(params[:id])
    end

    def contract_type_params
      params.require(:contract_type).permit(:name, :description, :value, :value_type)
    end
end
