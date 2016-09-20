class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :location
      t.float :latitude
      t.float :longitude
      t.text :description
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
