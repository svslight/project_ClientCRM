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

  # Список моделей с переводом
  def model_list
    model_names = []    
    ActiveRecord::Base.connection.tables.map do |model|      
      model_en = model.capitalize.singularize.camelize
      if !["SchemaMigration", "ArInternalMetadatum"].include?(model_en)
        model_names << [t('activerecord.models.' + model_en), model_en]
      end
    end
    @models = [["Все", "all"]] + model_names.sort
  end

  def load_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :code, :role_read, :role_create, :role_update, :role_destroy)
  end  
end
