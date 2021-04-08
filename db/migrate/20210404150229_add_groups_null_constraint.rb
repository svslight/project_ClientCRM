class AddGroupsNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:groups, :name, true)
    change_column_null(:groups, :city, true)
    change_column_null(:groups, :email, true)
    change_column_null(:groups, :phon, true)
  end
end
