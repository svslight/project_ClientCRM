class CreateProjectTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :project_teams do |t|
      t.references :project, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
