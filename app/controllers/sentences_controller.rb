class SentencesController < ApplicationController
  def sampler
    @phrases = Sentence.find_phrases_by(text: params[:text])
    respond_to do |format|
      format.json { render json: @phrases }
      format.html { render :sampler }
    end
  end
end
