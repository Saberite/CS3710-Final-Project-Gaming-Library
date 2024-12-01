class AddRoleToGamers < ActiveRecord::Migration[7.1]
  def change
    add_column :gamers, :role, :interger
  end
end
