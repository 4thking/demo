class AddCasualToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :casual, :boolean
  end
end
