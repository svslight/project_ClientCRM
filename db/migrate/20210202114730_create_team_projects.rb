class CreateTeamProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :team_projects do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
