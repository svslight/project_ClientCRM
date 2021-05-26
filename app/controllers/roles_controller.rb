class RolesController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_role, only: [:update, :destroy]
  
  expose :roles, ->{ Role.all }
  expose :role

  authorize_resource

  def index
    model_list
  end

  def new
    model_list
  end  

  def create
    if role.save
      redirect_to role_path(role), notice: 'Role successfully created'
    else
      render :new
    end
  end

  def update
    role.update(role_params)
    redirect_to roles_path
  end

  def destroy
    role.destroy
    redirect_to roles_path, notice: 'Role was successfully deleted.'
  end

  private

  def model_list
    @models = ["all"] + models.sort
    @models.delete("SchemaMigration")
    @models.delete("ArInternalMetadatum")
  end

  def models
    ActiveRecord::Base.connection.tables.map do |model|
      model.capitalize.singularize.camelize
    end
  end

  def load_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :code, :role_read, :role_create, :role_update, :role_destroy)
  end  
end
