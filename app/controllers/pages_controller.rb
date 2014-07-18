class PagesController < ApplicationController
  def index
    @icons = Icon.all
  end
end
