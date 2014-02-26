class ThemesController < ApplicationController
  def index
    @themes = Theme.published
  end

  def show
    @theme = Theme.friendly.find(params[:id])
  end

  def home
    @theme = Theme.published.first
  end
end
