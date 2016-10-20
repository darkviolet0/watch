class AddIndexToTable < ActiveRecord::Migration[5.0]
  def change
  	add_index :cycle_tracks, :name
  end
end
