class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.admin?
      can :manage, :all
    else

      can :read, Chat, sender_id:   user.id
      can :read, Chat, receiver_id: user.id
      can :create, Chat


      can :read, Message, chat: { sender_id:   user.id }
      can :read, Message, chat: { receiver_id: user.id }
      can :create, Message
      can [:update, :destroy], Message, user_id: user.id
    end
  end
end
