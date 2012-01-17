require "spec_helper"

describe ExamplesController do
  describe "routing" do

    it "has the root route" do
      get("/").should route_to("examples#index")
    end

    it "routes to #index" do
      get("/examples").should route_to("examples#index")
    end

    it "doesnt route anything else" do
      { :post =>   "/examples" }.should_not be_routable
      { :put =>    "/examples" }.should_not be_routable
      { :delete => "/examples" }.should_not be_routable
    end

  end
end
