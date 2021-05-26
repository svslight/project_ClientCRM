class UsersController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_user, only: [:update, :destroy]

  expose :users, ->{ User.all }
  expose :user

  authorize_resource

  def create
    @user=User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render new
    end
  end

  def update
    user.update(user_params)
    redirect_to users_path
  end

  def destroy
    user.destroy
    redirect_to users_path, notice: 'User was successfully deleted'
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :client_id, :first_name, :last_name, :rids)
  end
end
