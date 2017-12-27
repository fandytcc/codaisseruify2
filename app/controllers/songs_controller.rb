class SongsController < ApplicationController
  before_action :set_song, only: [:show, :destroy]

  def index
    @songs = Song.all
  end

  def show; end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to root_path, notice: "Song is successfully created"
    else
      render "new"
    end
  end

  def destroy
    @song.destroy
    redirect_to root_path, notice: "Song is successfully removed"
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_id)
  end

end
