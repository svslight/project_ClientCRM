class DropTableTeamProjects < ActiveRecord::Migration[6.1]
  def up
    drop_table :team_projects, if_exists: true
  end
end
