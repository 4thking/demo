class AddLanguageIdToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :language, index: true, foreign_key: true
  end
end
