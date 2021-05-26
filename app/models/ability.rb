# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    
    if user
      !user.admin? ? user_abilities : admin_abilities
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
  
  def user_abilities
    # can :read, :all
    # can %i[create update], [Client, Status, Group, GroupStatus, GroupPosition, Project, TeamPosition]

    user.roles.each do |role|
      can :read, role.role_read.strip.split(/\s/).include?('all') ? :all : role.role_read.strip.split(/\s/)
      can :create, role.role_create.strip.split(/\s/).include?('all') ? :all : role.role_create.strip.split(/\s/)
      can :update, role.role_update.strip.split(/\s/).include?('all') ? :all : role.role_update.strip.split(/\s/)
      can :destroy, role.role_destroy.strip.split(/\s/).include?('all') ? :all : role.role_destroy.strip.split(/\s/)
    end
  end
end
