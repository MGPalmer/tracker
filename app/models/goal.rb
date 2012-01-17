class Goal < ActiveRecord::Base
  has_many :rules
  has_many :pixels, :through => :rules
end
