class Campaign < ActiveRecord::Base
  has_and_belongs_to_many :scripts
end
