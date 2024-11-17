class CreateGamerprofiles < ActiveRecord::Migration[7.1]
  def change
    create_table :gamerprofiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :favorite_genere
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
