class ThemesController < ApplicationController
  def index
    @themes = Theme.published
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def latest
    @theme = Theme.published.last
  end
end
