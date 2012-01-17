class PixelsController < ApplicationController

  def index
    @pixels = Pixel.superfind(params[:campaign], params[:goal])
    render :layout => false
  end
  
end
