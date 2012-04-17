class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :comments, User
    can :favorites, User
    if user.admin?
      can :manage, :all
    elsif user.normal_user?
      can :manage, Favorite, :user_id => user.id
      can :manage, User, :id => user.id
      can :manage, Comment, :user_id => user.id
    end
  end
end
