class Sentence < ActiveRecord::Base
  def self.find_phrases_by(options = {})
    Sentence.where(options).pluck(:id, :text)
  end
end
