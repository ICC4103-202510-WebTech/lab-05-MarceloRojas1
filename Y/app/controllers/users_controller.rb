class UsersController < ApplicationController
  before_action :authenticate_user!                       
  load_and_authorize_resource      
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Usuario creado'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Usuario actualizado'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
