class AddPositionthreeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :positionthree, :boolean
  end
end
