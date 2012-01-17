class PixelsController < ApplicationController

  def index
    @pixels = Pixel.all_by_refs(params[:campaign], params[:goal], params[:deal])
    render :layout => false
  end
  
end
