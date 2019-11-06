# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    # Anyone can view homepage
    can :read, :home
    return if @user.role.blank?

    employee_abilities if @user.employee?
    can :manage, :all if @user.admin?
  end

  def employee_abilities
    can :read, Survey
    can :create, Nomination
    can [:read, :update], @user
    can :office, @user
  end
end
