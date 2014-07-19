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

    @sentences = Sentence.where(id: sentence_ids_map.inject(:&))
    render layout: false
  end

  def speak
    @sentence   = Sentence.find(params[:id])
    user_agent = request.user_agent
    conn = Faraday.new(url: 'https://translate.google.com') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get do |req|
      req.url "/translate_tts?tl=en&q=#{CGI.escape(@sentence.body_en)}"
      req.headers['User-Agent'] = user_agent
    end
    send_data(response.body, type: response.headers['content-type'], disposition: 'inline')
  end

private

  def sentence_params
    params.require(:sentence).permit(:body_en, :body_ja)
  end
end
