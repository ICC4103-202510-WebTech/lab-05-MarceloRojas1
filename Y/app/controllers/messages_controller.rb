class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :chat
  load_and_authorize_resource :message, through: :chat

  
  def index
    @messages = @chat.messages.includes(:user)
  end

  
  def new
    # @message lo construye CanCanCan
  end


  def edit; end


  def update
    if @message.update(message_params)
      redirect_to chat_messages_path(@chat), notice: 'Mensaje actualizado'
    else
      render :edit
    end
  end


  def create
    @message.user = current_user
    if @message.save
      redirect_to chat_messages_path(@chat), notice: 'Mensaje enviado'
    else
      render :new
    end
  end

  
  def destroy
    @message.destroy
    redirect_to chat_messages_path(@chat), notice: 'Mensaje eliminado'
  end

  private

  def message_params
    params.require(:message).permit(:body)  
  end
end


