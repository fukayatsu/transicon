class IconsController < ApplicationController
  def index
    @icon = Icon.new
    @icons = Icon.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    Icon.create(icon_params)
    redirect_to icons_path
  end

private

  def icon_params
    params.require(:icon).permit(:image, :category_id, :word)
  end
end
