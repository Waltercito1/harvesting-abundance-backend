class CreateHarvestSites < ActiveRecord::Migration[6.1]
  def change
    create_table :harvest_sites do |t|
      t.references :tree, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
