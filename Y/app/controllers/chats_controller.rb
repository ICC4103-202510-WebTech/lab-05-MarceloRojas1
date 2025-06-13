class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource


  def index
    @chats = Chat.inbox(current_user)
  end


  def new
    @chat  = Chat.new
    @users = User.where.not(id: current_user.id) 
  end


  def create
    @chat = current_user.chats_as_sender.build(chat_params)

    if @chat.save
      redirect_to chat_messages_path(@chat), notice: 'Chat creado'
    else
      @users = User.where.not(id: current_user.id)
      render :new
    end
  end

  private


  def chat_params
    params.require(:chat).permit(:receiver_id)
  end
end


