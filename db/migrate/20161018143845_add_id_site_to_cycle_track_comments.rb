class AddIdSiteToCycleTrackComments < ActiveRecord::Migration[5.0]
  def change
    add_column :cycle_track_comments, :id_site, :integer
    add_index :cycle_track_comments, :id_site
  end
end
