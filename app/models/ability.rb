class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Book do |post|
      post.try(:user_id) == user.id
    end
  end
end
