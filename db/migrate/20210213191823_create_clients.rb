class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.date :birthdate
      t.string :city
      t.string :address
      t.string :email
      t.string :phon
      t.string :skype
      t.date :entry_date
      t.integer :lesson_number
      t.date :communicant_date
      t.string :comments
      t.references :country, null: false, foreign_key: true
      t.references :client_status, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.references :group_position, null: false, foreign_key: true      
      t.references :team_project, null: false, foreign_key: true
      t.references :team_position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
