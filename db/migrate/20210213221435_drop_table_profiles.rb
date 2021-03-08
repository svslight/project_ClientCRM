class DropTableProfiles < ActiveRecord::Migration[6.1]
  def change
    drop_table :profiles, if_exists: true
  end
end
