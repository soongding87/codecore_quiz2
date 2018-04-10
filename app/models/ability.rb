class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.is_admin?
      can :manage, :all
    else
      can :read, :all
    end

    can(:manage, Idea) do |idea|

      user == idea.user
    end


    can(:manage, Review) do |review|
      user == review.user
    end


  end
end
