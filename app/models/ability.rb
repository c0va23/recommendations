class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Thing, approved: true
    can :create, Thing
    if user
      can :manage, Score, user_id: user.id
    end
  end
end
