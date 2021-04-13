class GroupPositionsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_group_position, only: [:update, :destroy]

  expose :group_positions, ->{ GroupPosition.all }
  expose :group_position

  def create
    if group_position.save
      redirect_to group_position_path(group_position), notice: 'Group Position successfully created'
    else
      render :new
    end
  end

  def update
    group_position.update(group_position_params)
  end

  def destroy
    group_position.destroy
    redirect_to group_positions_path, notice: 'Group Position was successfully deleted.'
  end

  private

  def group_position_params
    params.require(:group_position).permit(:name)
  end

  def load_group_position
    @group_position = GroupPosition.find(params[:id])
  end
end
