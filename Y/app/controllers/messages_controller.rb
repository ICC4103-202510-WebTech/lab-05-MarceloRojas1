class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @messages = Message.includes(:user, :chat)
  end

  def show; end

  def new; end

  def create
    @message.user = current_user
    if @message.save
      redirect_to @message, notice: "Mensaje creado"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: "Mensaje actualizado"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path, notice: "Mensaje eliminado"
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_id)
  end
end
