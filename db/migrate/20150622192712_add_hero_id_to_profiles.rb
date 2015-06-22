class AddHeroIdToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :hero, index: true, foreign_key: true
  end
end
