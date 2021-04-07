class DropIndexTeamProjectToClients < ActiveRecord::Migration[6.1]
  def change
    remove_column :clients, :team_project_id
  end
end
