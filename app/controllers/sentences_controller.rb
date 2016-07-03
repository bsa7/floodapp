# serve random sentence queries
class SentencesController < ApplicationController
  def sampler
    phrases = {
      sentence: Sentence.find_phrases_by(text: params[:text]),
      random_icon: Icon.sample_icon
    }
    respond_to do |format|
      format.json { render json: phrases }
      format.html { render :sampler }
    end
  end
end
