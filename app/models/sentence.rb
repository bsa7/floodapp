# Random sentence sampler
class Sentence < ActiveRecord::Base
  def self.find_phrases_by(options = {})
    if options[:text]
      Sentence.where("text ILIKE '%#{options[:text]}'").pluck(:id, :text)
    else
      Sentence.order('RANDOM()').limit(1).pluck(:id, :text).first
    end
  end
end
