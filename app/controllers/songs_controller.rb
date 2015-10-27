class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(songs_params)
    # add if save...
    redirect_to action: :index
  end

private
  def songs_params
    params.require(:song).permit(:url, :length)
  end
end
