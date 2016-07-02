class Sentence < ActiveRecord::Base
  def self.find_phrases_by(options = {})
    if options[:text]
      result = Sentence.where("text ILIKE '%#{options[:text]}'").pluck(:id, :text).limit(10)
    else
      result = Sentence.order('RANDOM()').limit(1).pluck(:id, :text).first
    end
    icon_name = Icon.order('RANDOM()').limit(1).pluck(:name).first
    {
      sentence: result,
      random_icon: icon_name
    }
  end
end
