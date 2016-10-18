class CycleTrack < ApplicationRecord
	has_many :CycleTrackComment 
	belongs_to :Site, foreign_key: "id_site"
end
