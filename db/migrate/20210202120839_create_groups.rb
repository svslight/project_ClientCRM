class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :city
      t.string :email
      t.string :phon
      t.string :skype
      t.date :entry_date
      t.string :comments
      t.references :country, null: false, foreign_key: true
      t.references :group_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
