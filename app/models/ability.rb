# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.seller?
      # Operators
      if user.is? :manager
       # Only Manager can access
       can :read, :report
       can :read, MenuCategory
       can :manage, MenuCategory
       
      
      elsif user.is? :admin
        # Only Admin can access
        can :manage, :all
      end
      # For both Manager and Admin
      
    elsif user.customer?
      # Frontend users
      
    end
  end
end
