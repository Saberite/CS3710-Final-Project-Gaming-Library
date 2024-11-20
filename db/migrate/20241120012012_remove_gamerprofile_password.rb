class RemoveGamerprofilePassword < ActiveRecord::Migration[7.1]
  def change
    remove_column :gamerprofiles, :password
  end
end
