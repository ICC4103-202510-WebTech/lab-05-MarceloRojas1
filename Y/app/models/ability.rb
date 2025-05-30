class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user                         

    if user.admin?
      can :manage, :all                          # Admin: todo
    else
      # Usuarios normales
      can :read, :all
      can :create, Message
      can [:update, :destroy], Message, user_id: user.id

    end
  end
end
