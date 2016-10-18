class AddIdSiteToCycleTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :cycle_tracks, :id_site, :integer
    add_index :cycle_tracks, :id_site
  end
end
