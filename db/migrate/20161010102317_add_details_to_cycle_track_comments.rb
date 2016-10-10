class AddDetailsToCycleTrackComments < ActiveRecord::Migration[5.0]
  def change
    add_column :cycle_track_comments, :rating_pleasure, :integer
    add_column :cycle_track_comments, :rating_security, :integer
  end
end
