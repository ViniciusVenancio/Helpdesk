class AmendmentsController < ApplicationController
  before_action :set_amendment, only: [:show, :edit, :update, :destroy]
  before_action :set_contracts, only: [:edit, :update, :create, :new]
  after_action :update_contract_value!, only: [:update, :create]

  respond_to :html

  def index
    @amendments = Amendment.all
    respond_with(@amendments)
  end

  def show
    respond_with(@amendment)
  end

  def new
    @amendment = Amendment.new
    respond_with(@amendment)
  end

  def edit
  end

  def create
    @amendment = Amendment.new(amendment_params)
    @amendment.save
    respond_with(@amendment)
  end

  def update
    @amendment.update(amendment_params)
    respond_with(@amendment)
  end

  def destroy
    @amendment.destroy
    respond_with(@amendment)
  end

  private
    def set_amendment
      @amendment = Amendment.find(params[:id])
    end

    def amendment_params
      params.require(:amendment).permit(:contract_id, :start_date, :end_date, :value, :number, :title)
    end

    def set_contracts
      @contracts = Contract.all
    end
    
    #atualiza valor atual da tabela do contrato!
    def update_contract_value!
      
      #procuro o contrato a ser atualizado
      contract = Contract.find(params[:contract_id])

      #atribuo o valor dele ao contador
      sum = contract.monthly_payment

      #procuro todos os aditamentos desse contrato e retorno um array
      amendments = Amendment.where('contract_id = #{params[:contract_id]}')

      #faço o cálculo dos aditamentos
      value_to_update = amendments.each { |amendment| sum += amendment.value }

      #atualizo o valor atual do contrato
      contract.update_attribute(contract.current_value, value_to_update)
    
    end
end