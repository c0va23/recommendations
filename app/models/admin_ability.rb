class AdminAbility
  include CanCan::Ability

  def initialize(user)
    if user.try(:admin?)
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard

      can :manage, Thing
      can :manage, Tag
      can :manage, User
      can :manage, Score
      cannot :destroy, User
    end
  end
end
