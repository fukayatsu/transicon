class IconsController < ApplicationController
  def index
    @icon = Icon.new
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
