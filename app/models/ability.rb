class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Thing, approved: true
    if user
      can :read, Score, user_id: user.id
    end
  end
end
