class Song < ActiveRecord::Base
  belongs_to :user

  validates :url, url: true
  before_create :set_duration

  def category
    if duration < 60
      'white_tea'
    elsif duration < 180
      'green_tea'
    elsif duration < 300
      'black_tea'
    elsif duration < 420
      'roiboos_tea'
    elsif duration > 420
      'herbal_tea'
    end
  end

  # scope :white_tea, -> { where("duration > ? and duration < ?", 30, 60)}
  # scope :green_tea, -> { where("duration > ? and duration < ?", 60, 180)}
  # scope :black_tea, -> { where("duration > ? and duration < ?", 180, 300) }
  # scope :roiboos_tea, -> { where("duration > ? and duration < ?", 300, 420) }
  # scope :herbal_tea, -> { where("duration > ?", 420) }

  def set_duration
    video = Yt::Video.new url: self.url
    self.duration = video.duration
  end

end
