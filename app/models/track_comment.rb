class TrackComment < ApplicationRecord
  belongs_to :User
  belongs_to :CycleTrack
end
