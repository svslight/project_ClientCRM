class GroupsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_group, only: [:update, :destroy]

  expose :groups, ->{ Group.all }
  expose :group

  def create
    if group.save
      redirect_to group_path(group), notice: 'Group successfully created'
    else
      render :new
    end
  end

  def update
    group.update(group_params)
  end

  def destroy
    group.destroy
    redirect_to groups_path, notice: 'Group was successfully deleted.'
  end

  private

  def load_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :city, :country_id, :group_status_id,
                                  :entry_date, :email, :skype, :phon, :comments)
  end
end
