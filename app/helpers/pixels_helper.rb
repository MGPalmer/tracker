module PixelsHelper
  def render_pixel(pixel)
    pixel.content.html_safe
  end
end
