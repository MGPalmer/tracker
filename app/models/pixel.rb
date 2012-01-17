class Pixel < ActiveRecord::Base
  has_many :rules
  has_many :campaigns, :through => :rules
  has_many :goals,     :through => :rules
  has_many :deals,     :through => :rules

  validates :name, :content, :presence => true

  class << self
    def superfind(campaign_ref = nil, goal_ref = nil, deal_ref = nil)
      joins("
          JOIN rules ON pixels.id = rules.pixel_id
          LEFT OUTER JOIN campaigns ON campaigns.id = rules.campaign_id
          LEFT OUTER JOIN goals     ON goals.id     = rules.goal_id
          LEFT OUTER JOIN deals     ON deals.id     = rules.deal_id
        "
        ).where(
          "(pixels.enabled = :pixel_enabled) AND
           (#{campaign_ref.blank? ? '' : '(campaigns.ref = :campaign_ref AND campaigns.enabled = :campaign_enabled) OR '}rules.campaign_id IS null) AND
           (#{goal_ref.blank? ? '' : 'goals.ref = :goal_ref OR '}rules.goal_id IS null) AND
           (#{deal_ref.blank? ? '' : 'deals.ref = :deal_ref OR '}rules.deal_id IS null)
          ",
          :campaign_ref => campaign_ref,
          :goal_ref => goal_ref,
          :deal_ref => deal_ref,
          :pixel_enabled => true,
          :campaign_enabled => true
        ).all
    end
  end
end
