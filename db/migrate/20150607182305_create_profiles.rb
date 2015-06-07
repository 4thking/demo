class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :description
      t.string :steam
      t.integer :mmr
      t.boolean :carry
      t.boolean :mid
      t.boolean :support
      t.boolean :offlane
      t.boolean :jungle

      t.timestamps null: false
    end
  end
end
