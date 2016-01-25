module EmbedVideoHelper

  def embed(youtube_url, w, h)
    youtube_id = youtube_url.split("=").last

    content_tag(:iframe, nil, src: "http://youtube.com/embed/#{youtube_id}", width:w, height:h)
  end

end
