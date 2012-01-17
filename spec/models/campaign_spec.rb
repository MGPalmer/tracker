require 'spec_helper'

describe Campaign do

  before(:each) do
    @campaign = Factory(:campaign)
    @pixel = Factory(:pixel)
  end

  context "associations" do
    it "has many rules" do
      @campaign.rules.should == []
      @campaign.rules.create!(:pixel => @pixel)
      @campaign.rules.count.should == 1
      rule = @campaign.rules.last
      rule.campaign_id.should == @campaign.id
      rule.pixel_id.should == Pixel.last.id
      rule.deal_id.should be_nil
      rule.goal_id.should be_nil
    end

    it "has many pixels" do
      @campaign.pixels.should == []
      Rule.count.should be_zero
      Pixel.count.should be_zero
      @campaign.pixels << @pixel
      Rule.count.should == 1
      Pixel.count.should == 1
      @campaign.pixels.last.name.should == "superpixel"
    end

  end

  context "validation" do

    it "has a valid test instance" do
      @campaign.should be_valid
    end

    it "is not valid without name" do
      @campaign.name = nil
      @campaign.should_not be_valid
    end

    it "is not valid without ref" do
      @campaign.ref = nil
      @campaign.should_not be_valid
    end
  end
end
