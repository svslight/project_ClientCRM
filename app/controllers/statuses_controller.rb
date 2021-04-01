class StatusesController < ApplicationController
  
  before_action :authenticate_user!, except: %i[index show]
  before_action :load_status, only: [:update, :destroy]
  
  expose :statuses, ->{ Status.all }
  expose :status

  def create
    if status.save
      redirect_to status_path(status), notice: 'Status successfully created'
    else
      render :new
    end
  end

  def update
    status.update(status_params)
  end

  def destroy
    status.destroy
  end

  private

  def load_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:name)
  end
end
