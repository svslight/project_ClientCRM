class AddClientIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :client, foreign_key: true
  end
end
