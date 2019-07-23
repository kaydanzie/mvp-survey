# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Anyone can view homepage
    can :read, :home

    employee_abilities if user.employee?
    can :manage, :all if user.admin?
  end

  def employee_abilities
    can :read, Survey
  end
end
