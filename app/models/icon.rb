# icon class
class Icon < ActiveRecord::Base
  def self.sample_icon
    Icon.order('RANDOM()').limit(1).pluck(:name).first
  end
end
