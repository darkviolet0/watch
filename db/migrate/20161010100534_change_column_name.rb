class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :cycle_track_comments, :rating, :rating_speed
  end
end
