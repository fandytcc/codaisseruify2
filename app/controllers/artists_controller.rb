class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show
    @photos = @artist.photos
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      image_params.each do |image|
        @artist.photos.create(image: image)
      end

      redirect_to @artist, notice: "Artist is successfully created"
    else
      render 'new'
    end
  end

  def edit
    @photos = @artist.photos
  end

  def update
    if @artist.update(artist_params)
      image_params.each do |image|
        @artist.photos.create(image: image)
      end

      redirect_to edit_artist_path(@artist), notice: "Artist is successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to root_path, notice: "Artist is successfully removed"
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:first_name, :last_name, :bio)
  end

  def image_params
    params[:images].present? ? params.require(:images) : []
  end
end
