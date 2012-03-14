class Ability
  include CanCan::Ability

  def initialize(user)
    can :access, :rails_admin
    if user.admin?
      can :manage, :all
    end
  end
end
