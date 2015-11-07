class Song < ActiveRecord::Base
  scope :white_tea, -> { where("duration < ?", 73) }

  def set_duration
    video = Yt::Video.new url: self.url
    self.duration = video.duration
  end


  def category
    if duration < 73
      "white tea"
    elsif duration < 188
      "green tea"
    end


  end

end
