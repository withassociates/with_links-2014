class ThemesController < ApplicationController
  def view
    @themes = Theme.published.order('issue_date DESC')
  end

  def show
    @theme = Theme.friendly.find(params[:id])
  end

  def latest
    @theme = Theme.published.last
  end

  def index
    @themes = Theme.published.order('issue_number DESC').paginate(page: params[:page], per_page: 1)
  end
end
