class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
    @songs = @songs.order(:id)
  end

  def show; end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song.artist, notice: "Song is successfully created" }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { redirect_to @song.artist }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song.artist, notice: "Song is successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { redirect_to @song.artist }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to @song.artist, notice: "Song is successfully removed." }
      format.json { head :no_content }
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :selected, :artist_id)
  end
end
