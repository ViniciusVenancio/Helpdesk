class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_enterprises
  after_action :set_enterprise, only: [:create]
  before_action :verify_user_enteprise, only: [:new]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.newest_first.visible(current_user).group_by_status

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    parametro = params[:ticket][:enterprise_id]

    #qualquer problema, alterar o ||= para if @ticket.user.nil?
    if parametro
      @ticket.user ||= Enterprise.find(parametro).user
    else
      @ticket.user ||= current_user
    end

    @ticket.agent = User.default_agent if @ticket.agent.nil?

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :ok }
    end
  end

  protected

  def ticket_params
    params.require(:ticket).permit(:user_id, :agent_id, :priority, :status, :subject, :body, :enterprise_id)
  end

  def set_enterprises
    @enterprises = Enterprise.where.not(user_id: nil)
  end

  #seto a empresa do usuário(customer) para o Ticket criado
  def set_enterprise
    unless params[:ticket][:enterprise_id]
      if current_user.role? :customer
        @ticket.update_attribute(:enterprise_id, current_user.enterprise.id)
      end
    end
  end

  def verify_user_enteprise
    redirect_to root_path if current_user.enterprise.nil? and current_user.role.eql? 'customer'
  end

end