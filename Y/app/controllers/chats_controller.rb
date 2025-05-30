class ChatsController < ApplicationController
  before_action :authenticate_user!                       
  load_and_authorize_resource                               
  before_action :set_chat, only: :show

  def index
    @chats = Chat.all
  end

  def show
    @messages = @chat.messages.includes(:user)
  end

  def new
    @chat = Chat.new
    @users = User.all
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to @chat, notice: 'Chat creado'
    else
      @users = User.all
      render :new
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
end

