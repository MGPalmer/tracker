class Campaign < ActiveRecord::Base
  has_many :rules
  has_many :pixels, :through => :rules

  validates :name, :ref, :presence => true
end
