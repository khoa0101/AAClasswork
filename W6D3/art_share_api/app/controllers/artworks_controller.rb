class ArtworksController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    artwork = user.artworks
    shared_artworks = user.shared_artworks
    render json: artwork + shared_artworks
  end

  def show
    artwork = Artwork.find_by(id: params[:id])

    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])

    if artwork.update_attributes(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      artwork.destroy
      render json: artwork
    # else
    #   render "no artwork found with that id"
    # not needed
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :img_url, :artist_id)
  end

end