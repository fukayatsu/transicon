class SentencesController < ApplicationController
  def index
  end

  def create
    sentence = Sentence.create(sentence_params)
    require 'pry'; binding.pry
    return json: sentence.to_json
  end

private

  def sentence_params
    params.require(:sentence).permit(:body_en, :body_ja)
  end
end
