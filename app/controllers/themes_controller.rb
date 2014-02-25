class ThemesController < ApplicationController
  def all
    @themes = Theme.published.order('issue_date DESC')
  end

  def show
    @theme = Theme.friendly.find(params[:id])
  end

  def latest
    @theme = Theme.published.last
  end

  def index
    @theme = Theme.published.last
  end
end
