class RolesController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_role, only: [:update, :destroy]
  
  expose :roles, ->{ Role.all }
  expose :role

  authorize_resource

  def create
    if role.save
      redirect_to role_path(role), notice: 'Role successfully created'
    else
      render :new
    end
  end

  def update
    role.update(role_params)
  end

  def destroy
    role.destroy
    redirect_to roles_path, notice: 'Role was successfully deleted.'
  end

  private

  def load_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end

end
