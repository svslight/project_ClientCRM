class AddCodeAttributesToRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :code, :string, null: false, default: 'user'
  end
end
