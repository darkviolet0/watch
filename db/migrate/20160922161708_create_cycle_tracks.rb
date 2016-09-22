class CreateCycleTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :cycle_tracks do |t|
      t.string :name
      t.string :typology
      t.string :side
      t.line_string :geometry
      t.st_point :point
      t.boolean :wood
      t.integer :district

      t.timestamps
    end
  end
end
