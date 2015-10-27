class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(songs_params)
    redirect_to action: :index
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(songs_params)
    redirect_to action: :index
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to action: :index
  end

private
  def songs_params
    params.require(:song).permit(:url, :length)
  end
end
