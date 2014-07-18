class SentencesController < ApplicationController
  def index
  end

  def create
    sentence = Sentence.create(sentence_params)
    icon_ids = params[:icons].split(',')

    icon_ids.each do |icon_id|
      IconSentence.find_or_create_by(icon_id: icon_id, sentence_id: sentence.id)
    end

    render json: sentence.to_json
  end

  def search
    require 'pry'; binding.pry
  end

private

  def sentence_params
    params.require(:sentence).permit(:body_en, :body_ja)
  end
end
