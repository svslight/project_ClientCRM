class DropTableClientStatuses < ActiveRecord::Migration[6.1]
  def up
    drop_table :client_statuses, if_exists: true
  end
end
