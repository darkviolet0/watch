class CycleTrackComment < ApplicationRecord
  belongs_to :User
  belongs_to :CycleTrack

scope :most_commented, -> (num) { CycleTrackComment.group('cycle_track_id').order('count_id desc').limit(num).count('id')}


end
