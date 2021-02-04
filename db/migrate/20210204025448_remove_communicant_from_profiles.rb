class RemoveCommunicantFromProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :communicant, :string
  end
end
