class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (nog logged in)
    can :manage, User, id: user.id
  end
end
