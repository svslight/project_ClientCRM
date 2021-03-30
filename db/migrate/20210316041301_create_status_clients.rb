class CreateStatusClients < ActiveRecord::Migration[6.1]
  def change
    create_table :status_clients do |t|
      t.references :status, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
