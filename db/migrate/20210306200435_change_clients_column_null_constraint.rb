class ChangeClientsColumnNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:clients, :birthdate, true)
    change_column_null(:clients, :patronymic, true)
    change_column_null(:clients, :country_id, true)
    change_column_null(:clients, :client_status_id, true)
    change_column_null(:clients, :group_id, true)
    change_column_null(:clients, :group_position_id, true)
    change_column_null(:clients, :team_project_id, true)
    change_column_null(:clients, :team_position_id, true)
  end
end
