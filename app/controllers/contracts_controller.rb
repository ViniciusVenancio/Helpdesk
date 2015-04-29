class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update]
  before_action :set_enterprises, only: [:edit, :new]
  before_action :set_contract_types, only: [:edit, :new]
  before_action :authenticate_user!
  before_action :require_admin!

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
    set_current_value
    respond_with(@contract)
  end

  def update
    @contract.update(contract_params)
    set_current_value
    respond_with(@contract)
  end

  private
    def set_contract
      @contract = Contract.find(params[:id])
    end

    def contract_params
      params.require(:contract).permit(:enterprise_id, :start_date, :due_date, :monthly_payment, :sla, :contract_type_id, :current_value, :status)
    end

    def set_enterprises
      @enterprises = Enterprise.all  
    end

    def set_contract_types
      @types = ContractType.all
    end

    def require_admin!
      redirect_to root_path unless can? :manage, @contracts
    end

    def set_current_value
      @contract.current_value.nil? ? @contract.current_value = params[:contract][:monthly_payment] : @contract.current_value = @contract.monthly_payment
      @contract.save
    end
end