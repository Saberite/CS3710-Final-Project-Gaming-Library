class CreateLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :libraries do |t|
      t.string :game_name
      t.string :game_desc
      t.references :gameprofiles, null: false, foreign_key: true

      t.timestamps
    end
  end
end
