class SongsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :find_song, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @songs = @user.songs.order(created_at: :desc)

    if params[:white_tea]
      @songs = @user.songs.white_tea
      if @songs.empty?
        flash[:notice] = "There are no songs in this category".html_safe
        flash.discard
      end
    elsif params[:green_tea]
      @songs = @user.songs.green_tea
      if @songs.empty?
        flash[:notice] = "There are no songs in this category".html_safe
        flash.discard
      end
    elsif params[:black_tea]
      @songs = @user.songs.black_tea
      if @songs.empty?
        flash[:notice] = "There are no songs in this category".html_safe
        flash.discard
      end
    elsif params[:herbal_tea]
      @songs = @user.songs.herbal_tea
      if @songs.empty?
        flash[:notice] = "There are no songs in this category".html_safe
        flash.discard
      end
    end
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = @user.songs.build(songs_params)

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
    params.require(:song).permit(:url, :comment, :duration, :user_id, :authenticity_token)
  end

  def set_user
    user_id = current_user.id
    @user = User.find(user_id)
  end
end
