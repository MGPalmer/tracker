require 'spec_helper'

# rendering views is disabled by default
describe PixelsController do

  describe "GET index" do

    it "gets pixels from params and renders index without layout" do
      Pixel.should_receive(:all_by_refs).with("bla", "blub", "zork") { :pixels }
      get :index, {:campaign => "bla", :goal => "blub", :deal => "zork"}
      response.should render_template(:index)
      @layouts[nil].should == 1 # only way I could find to check that layout isn't rendered
      assigns(:pixels).should == :pixels
    end
  end

end
