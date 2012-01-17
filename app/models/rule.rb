class Rule < ActiveRecord::Base
  belongs_to :campaign, :dependent => :destroy
  belongs_to :goal, :dependent => :destroy
  belongs_to :deal, :dependent => :destroy
  belongs_to :pixel, :dependent => :destroy

  validates :pixel_id, :presence => true
  # uniqueness of id combinations ?
end