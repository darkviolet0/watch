class CycleTrackComment < ApplicationRecord
  belongs_to :User
  belongs_to :CycleTrack

scope :most_commented, -> (num, othernum) { CycleTrackComment.where(id_site: othernum).group('cycle_track_id').order('count_id desc').limit(num).count('id')}

scope :top_users, -> (num, othernum) { CycleTrackComment.where(id_site: othernum).group('users_id').order('count_users_id desc').limit(num).count('users_id')}

end
