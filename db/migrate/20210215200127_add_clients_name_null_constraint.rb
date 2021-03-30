class AddClientsNameNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:clients, :name, false)
    change_column_null(:clients, :surname, false)
    change_column_null(:clients, :patronymic, false)
    change_column_null(:clients, :birthdate, false)
    change_column_null(:clients, :city, false)
    change_column_null(:clients, :email, false)
  end
end
