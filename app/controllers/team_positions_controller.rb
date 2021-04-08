class TeamPositionsController < ApplicationController

  before_action :authenticate_user!, except: %i[index show]
  before_action :load_team_position, only: [:update, :destroy]

  expose :team_positions, ->{ TeamPosition.all }
  expose :team_position

  def create
    if team_position.save
      redirect_to team_position_path(team_position), notice: 'Team Position successfully created'
    else
      render :new
    end
  end

  def update
    team_position.update(team_position_params)

    # if team_position.update(team_position_params)
    #   redirect_to team_position_path(team_position)
    # else
    #   render :edit
    # end
  end

  def destroy
    team_position.destroy
    redirect_to team_positions_path, notice: 'Team Position was successfully deleted.'
  end

  private

  def team_position_params
    params.require(:team_position).permit(:name)
  end

  def load_team_position
    @team_position = TeamPosition.find(params[:id])
  end
end
