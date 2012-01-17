# -*- coding: utf-8 -*-
require 'spec_helper'

describe Pixel do

  before(:each) do
    @pixel = Factory(:pixel)
    @campaign = Factory(:campaign)
    @deal = Factory(:deal)
    @goal = Factory(:goal)
  end

  context "associations" do
    it "has many rules" do
      @pixel.rules.should == []
      expect { @pixel.rules.create!(:pixel => @pixel) }.to change { Rule.count }.from(0).to(1)
      @pixel.rules.should == [Rule.last]
    end

    it "has many campaigns" do
      @pixel.campaigns.should == []
      expect { @pixel.campaigns << @campaign }.to change { Rule.count }.from(0).to(1)
      @pixel.reload.campaigns.should == [@campaign]
    end

    it "has many goals" do
      @pixel.goals.should == []
      expect { @pixel.goals << @goal }.to change { Rule.count }.from(0).to(1)
      @pixel.reload.goals.should == [@goal]
    end

    it "has many deals" do
      @pixel.deals.should == []
      expect { @pixel.deals << @deal }.to change { Rule.count }.from(0).to(1)
      @pixel.reload.deals.should == [@deal]
    end

    it "can create multi-entity rules" do
      @pixel.rules.should == []
      expect {
        @pixel.rules.create(:deal => @deal, :campaign => @campaign, :goal => @goal)
      }.to change { Rule.count }.from(0).to(1)
      rule = @pixel.reload.rules.last
      rule.campaign.should == @campaign
      rule.deal.should == @deal
      rule.goal.should == @goal
    end

  end

  context "validation" do

    it "has valid test instance" do
      @pixel.should be_valid
    end

    it "is not valid without name" do
      @pixel.name = nil
      @pixel.should_not be_valid
    end

    it "is not valid without content" do
      @pixel.content = nil
      @pixel.should_not be_valid
    end

  end

  it "saves large text" do
    max = "x" * 16_777_215
    @pixel.update_attribute(:content, max)
    @pixel.reload.content.size.should == max.size

    max_unicode = 'Ø' * 16_777_215
    @pixel.update_attribute(:content, max_unicode)
    @pixel.reload.content.size.should == max_unicode.size

    # cuts off extra stuff
    @pixel.update_attribute(:content, max_unicode + "x")
    @pixel.reload.content.size.should == max_unicode.size
  end

  context "superfind" do

  end
end
