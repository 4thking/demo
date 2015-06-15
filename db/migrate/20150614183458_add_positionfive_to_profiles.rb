class AddPositionfiveToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :positionfive, :boolean
  end
end
