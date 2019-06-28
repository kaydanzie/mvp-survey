# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Anyone can view homepage
    can :read, :home

    can :manage, :all if user.admin?
  end
end
