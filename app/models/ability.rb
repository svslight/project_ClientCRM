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
    can :read, :all
  end

  def admin_abilities
    can :manage, :all
  end
  
  def user_abilities
    guest_abilities
    can %i[create update], [Client, Status, Group, GroupStatus, GroupPosition, Project, TeamPosition]
  end
end
