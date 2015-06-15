class AddPositiononeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :positionone, :boolean
  end
end
