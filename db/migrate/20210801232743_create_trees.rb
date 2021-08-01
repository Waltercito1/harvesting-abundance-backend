class CreateTrees < ActiveRecord::Migration[6.1]
  def change
    create_table :trees do |t|
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
