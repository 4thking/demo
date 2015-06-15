class AddDotabuffToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :dotabuff, :string
  end
end
