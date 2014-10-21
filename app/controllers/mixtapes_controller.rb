class MixtapesController < ApplicationController
  before_filter :set_tape, only: :show
   
  def new
    @mixtape = Mixtape.new
    @mixtape.artist = Artist.new
  end

  def create
    @mixtape = Mixtape.new(mixtape_params)
    @mixtape.save ? redirect_to(@mixtape) : redirect_to(root_url)
  end
  
  def show
  end

  private

  def mixtape_params
    params.require(:mixtape).permit(artist_attributes: [:spotify_id, :name])
  end

  def set_tape
    @mixtape = Mixtape.find(params[:id])
  end

end
