require "spec_helper"

describe PixelsController do
  describe "routing" do

    it "routes to #index" do
      get("/pixels").should route_to("pixels#index")
    end

    it "doesnt route anything else" do
      { :post =>   "/pixels" }.should_not be_routable
      { :put =>    "/pixels" }.should_not be_routable
      { :delete => "/pixels" }.should_not be_routable
    end

  end
end
