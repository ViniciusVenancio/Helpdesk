require 'date'

class AmendmentsController < ApplicationController
  before_action :set_amendment, only: [:show, :edit, :update, :destroy]
  before_action :set_contracts, only: [:edit, :update, :create, :new]
  after_action :update_contract_current_value, only: [:create, :update]

  respond_to :html

  def index
    @amendments = Amendment.all
    respond_with(@amendments)
  end

  def show
    respond_with(@amendment)
  end

  def other_new
    @amendment = Amendment.new
    contract = Contract.find(params[:contract_id])

    last_amendment = contract.amendments.last

    if contract.amendments.empty?
      end_date = contract.due_date
      condition = Date.today - contract.due_date < 30
    else
      end_date = last_amendment.end_date
      condition = Date.today - last_amendment.end_date < 30
    end

    if Date.today - end_date >= 30 || (end_date - Date.today).abs <= 30
      @start_date = end_date + 1
      @end_date = end_date + 365
    elsif condition
        @start_date = Date.today
        @end_date = end_date
    end

    respond_with(@amendment)
  end

  def edit
  end

  def create
    @amendment = Amendment.new(amendment_params)
    @amendment.number = Amendment.where("contract_id = ?", params[:amendment][:contract_id]).count + 1
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

    def update_contract_current_value
      contract = Contract.find(params[:amendment][:contract_id])
      sum = contract.monthly_payment
      amendments = Amendment.where("contract_id = ?", contract.id)
      amendments.each { |amendment| sum += amendment.value }
      contract.update_attribute('current_value', sum)
    end
end