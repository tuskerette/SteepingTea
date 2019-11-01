class Song < ActiveRecord::Base
  belongs_to :user

  validates :url, url: true
  before_create :set_duration

  scope :white_tea, -> { where("duration > ? and duration < ?", 30, 90)}
  scope :green_tea, -> { where("duration > ? and duration < ?", 91, 180)}
  scope :black_tea, -> { where("duration > ? and duration < ?", 181, 300) }
  scope :herbal_tea, -> { where("duration > ?", 301) }

  def video_id
    url.split("=").last
  end

  def set_duration
    v = Yt::Video.new(id: video_id)
    self.duration = v.duration
  end

end
