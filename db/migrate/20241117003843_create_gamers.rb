class CreateGamers < ActiveRecord::Migration[7.1]
  def change
    create_table :gamers do |t|
      t.string :first_name
      t.string :last_name
      t.string :favorite_genere
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
