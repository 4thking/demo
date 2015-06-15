class AddPositiontwoToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :positiontwo, :boolean
  end
end
