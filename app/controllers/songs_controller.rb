class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    if params[:white_tea]
      @songs = Song.white_tea
      if @songs.empty?
        flash[:notice] = "There are no songs in this category".html_safe
        flash.discard
      end
    elsif params[:green_tea]
      @songs = Song.green_tea
      if @songs.empty?
        flash[:notice] = "There are no songs in this category".html_safe
        flash.discard
      end
    elsif params[:black_tea]
      @songs = Song.black_tea
      if @songs.empty?
        flash[:notice] = "There are no songs in this category".html_safe
        flash.discard
      end
    elsif params[:roiboos_tea]
      @songs = Song.roiboos_tea
      if @songs.empty?
        flash[:notice] = "There are no songs in this category".html_safe
        flash.discard
      end
    elsif params[:herbal_tea]
      @songs = Song.herbal_tea
      if @songs.empty?
        flash[:notice] = "There are no songs in this category".html_safe
        flash.discard
      end
    else
      @songs = Song.order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(songs_params)
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
