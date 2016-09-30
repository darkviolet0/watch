class CreateCycleTrackComments < ActiveRecord::Migration[5.0]
  def change
    create_table :cycle_track_comments do |t|
      t.text :text
      t.integer :rating
      t.references :users, foreign_key: true
      t.references :cycle_tracks, foreign_key: true

      t.timestamps
    end
  end
end
