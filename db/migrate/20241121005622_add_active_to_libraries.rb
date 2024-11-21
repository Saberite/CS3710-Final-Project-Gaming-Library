class AddActiveToLibraries < ActiveRecord::Migration[7.1]
  def change
    add_column :libraries, :active, :boolean, default: false, null: false
  end
end
