class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Thing, approved: true
  end
end
