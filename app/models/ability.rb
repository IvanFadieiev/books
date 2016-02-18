class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Book do |book|
      book.try(:user_id) == user.id
    end
  end
end
