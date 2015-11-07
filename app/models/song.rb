class Song < ActiveRecord::Base

  def self.get_duration(youtube_url, comment)
    song = Yt::Video.new url: youtube_url
    song.length = song.duration
    song.comment = comment
  end


end
