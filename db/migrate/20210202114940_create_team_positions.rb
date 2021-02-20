class CreateTeamPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :team_positions do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end