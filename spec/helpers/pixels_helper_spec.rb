require 'spec_helper'

describe PixelsHelper do
  context "render_pixel" do

    before(:each) do
      @content = "<h1>aaaaAAAaa</h1>"
      @pixel = mock_model(Pixel, :content => @content)
    end

    it "returns the html safe content of the pixel" do
      @content.should_receive(:html_safe) { :very_safe }
      helper.render_pixel(@pixel).should == :very_safe
    end
  end
end
