class DropIndexToClients < ActiveRecord::Migration[6.1]
  def change
    remove_column :clients, :client_status_id
  end
end
