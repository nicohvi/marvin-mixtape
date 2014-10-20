class MixtapesController < ApplicationController
  before_filter :set_tape, only: :show
   
  def new
    @mixtape = Mixtape.new
  end

  def create
    @mixtape = Mixtape.new(mixtape_params)
    @mixtape.save ? redirect_to(@mixtape) : render('new')
  end
  
  def show
    @mixtape.setup!
  end

  private

  def mixtape_params
    params.require(:mixtape).permit(:artist)
  end

  def set_tape
    @mixtape = Mixtape.find(params[:id])
  end

end
