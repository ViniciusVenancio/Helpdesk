class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :filter_user, only: [:new, :edit]

  respond_to :html

  def index
    @enterprises = Enterprise.all
    respond_with(@enterprises)
  end

  def show
    respond_with(@enterprise)
  end

  def new
    @enterprise = Enterprise.new
    respond_with(@enterprise)
  end

  def edit
  end

  def create
    @enterprise = Enterprise.new(enterprise_params)
    @enterprise.save
    respond_with(@enterprise)
  end

  def update
    @enterprise.update(enterprise_params)
    respond_with(@enterprise)
  end

  def destroy
    @enterprise.destroy
    respond_with(@enterprise)
  end

  def filter_user
    @users = User.where("role = 'customer'")
    @users.each {|user| user.enterprise.nil? }
  end

  private
    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end

    def enterprise_params
      params.require(:enterprise).permit(:name, :password, :corporate_name, :phone, :cnpj, :state_registration, :adress, :number, :district, :city, :cep, :email, :user_id)
    end
end