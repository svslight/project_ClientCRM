# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    
    if user
      !user.admin? ? user_abilities(user) : admin_abilities
    else
      guest_abilities
    end
  end

  def guest_abilities
    user ||= User.new
  end

  def admin_abilities
    can :manage, :all
  end
  
  def user_abilities(user)
    user.roles.each do |role|
      [:read, :create, :update, :destroy].each { |action| can action, class_list( "role_#{action.to_s}", role)  }      
    end
  end

  def class_list(role_action, role)
    ability_classes = role.send(role_action).strip.split(/\s/)
    ability_classes.include?('all') ? :all : ability_classes.collect{ |c| c.constantize }
  end
end
