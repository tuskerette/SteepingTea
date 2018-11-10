class Song < ActiveRecord::Base
  belongs_to :user

  validates :url, url: true
  before_create :set_duration

  scope :white_tea, -> { where("duration > ? and duration < ?", 30, 90)}
  scope :green_tea, -> { where("duration > ? and duration < ?", 90, 180)}
  scope :black_tea, -> { where("duration > ? and duration < ?", 180, 300) }
  scope :herbal_tea, -> { where("duration > ?", 420) }

  def set_duration
    video = Yt::Video.new url: self.url
    self.duration = video.duration
  end

end
