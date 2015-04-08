class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  before_action :set_enterprises, only: [:edit, :new]
  before_action :set_contract_types, only: [:edit, :new]
  before_action :authenticate_user!
  before_action :validate_user

  respond_to :html

  def index
    @contracts = Contract.all
    respond_with(@contracts)
  end

  def show
    respond_with(@contract)
  end

  def new
    @contract = Contract.new
    respond_with(@contract)
  end

  def edit
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.save
    respond_with(@contract)
  end

  def update
    @contract.update(contract_params)
    respond_with(@contract)
  end

  def destroy
    @contract.destroy
    respond_with(@contract)
  end

  private
    def set_contract
      @contract = Contract.find(params[:id])
    end

    def contract_params
      params.require(:contract).permit(:enterprise_id, :start_date, :due_date, :monthly_payment, :sla, :contract_type_id)
    end

    def set_enterprises
      @enterprises = Enterprise.all  
    end

    def set_contract_types
      @types = ContractType.all
    end

    def validate_user
      redirect_to tickets_path unless current_user.role? :admin 
    end
end