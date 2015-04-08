class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here.
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :agent
      can [:edit, :update, :read], Ticket, :group => { :id => Ticket.where(:agent_id => user.id).collect{ |t| t.id } }
      can :manage, Ticket
      can :read, Enterprise
    else
      can :manage, Ticket do |ticket|
        ticket.agent_id == user.id or user.role? :admin
      end
    
      cannot :update_status, Ticket
    end
  end
end