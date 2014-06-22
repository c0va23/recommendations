class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Thing, approved: true
    can :create, Thing

    can :read, Comment
    can :create, Comment do |comment|
      can? :read, Thing
    end

    if user
      can :manage, Score, user_id: user.id
    end
  end
end
