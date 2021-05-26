class AddAttributesToRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :role_read, :string, default: '', null: false
    add_column :roles, :role_create, :string, default: '', null: false
    add_column :roles, :role_update, :string, default: '', null: false
    add_column :roles, :role_destroy, :string, default: '', null: false
  end
end
