class SentencesController < ApplicationController
  def index
  end

  def create
    require 'pry'; binding.pry
  end

private

  def sentence_params
    params.require(:sentence).permit(:body_en, :body_ja)
  end
end
