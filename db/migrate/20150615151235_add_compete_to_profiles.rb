class AddCompeteToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :compete, :boolean
  end
end
