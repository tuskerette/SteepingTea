class Song < ActiveRecord::Base

  scope :white_tea, -> { where("duration < ?", 60) }
  scope :green_tea, -> { where("duration < ?", 180) }
  scope :black_tea, -> { where("duration < ?", 300) }
  scope :roiboos, -> { where("duration < ?", 420) }
  scope :herbal_tea, -> { where("duration > ?", 600) }

  def set_duration
    video = Yt::Video.new url: self.url
    self.duration = video.duration
  end


  def category
    if duration < 60
      "White Tea"
    elsif duration < 180
      "Green Tea"
    elsif duration < 300
      "Black Tea"
    elsif duration < 420
      "Roiboos"
    elsif duration > 420
      "Herbal Tea"
    end


  end

end
