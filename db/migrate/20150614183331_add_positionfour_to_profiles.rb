class AddPositionfourToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :positionfour, :boolean
  end
end
