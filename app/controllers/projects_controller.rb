class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_project, only: [:update, :destroy]
  
  expose :projects, ->{ Project.all }
  expose :project

  def create
    if project.save
      redirect_to project_path(project), notice: 'Project successfully created'
    else
      render :new
    end
  end

  def update
    project.update(project_params)
  end

  def destroy
    project.destroy
    redirect_to projects_path, notice: 'Project was successfully deleted.'
  end

  private

  def load_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
