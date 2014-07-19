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
    sentences = Sentence.all.includes(:icon_sentences)
    return render json: [] if params[:icons].blank?

    sentence_ids_map = params[:icons].map do |icon_id|
      sentences.where(icon_sentences: { icon_id: icon_id }).pluck(:sentence_id)
    end

    render json: Sentence.where(id: sentence_ids_map.inject(:&))
  end

private

  def sentence_params
    params.require(:sentence).permit(:body_en, :body_ja)
  end
end
