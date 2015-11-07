class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.order(created_at: :desc)
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(songs_params)
    @song.set_duration
    if @song.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update_attributes(songs_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to action: :index
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def songs_params
    params.require(:song).permit(:url, :comment, :duration)
  end
end
