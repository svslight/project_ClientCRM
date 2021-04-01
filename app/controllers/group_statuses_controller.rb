class GroupStatusesController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_group_status, only: [:update, :destroy]

  expose :group_statuses, ->{ GroupStatus.all }
  expose :group_status

  def create
    if group_status.save
      redirect_to group_status_path(group_status), notice: 'Status group successfully created'
    else
      render :new
    end
  end

  def update
    group_status.update(group_status_params)
  end

  def destroy
    group_status.destroy
    redirect_to group_statuses_path, notice: 'Status group was successfully deleted.'
  end

  private

  def group_status_params
    params.require(:group_status).permit(:name)
  end

  def load_group_status
    @group_status = GroupStatus.find(params[:id])
  end

end
