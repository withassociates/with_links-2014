class ThemesController < ApplicationController
  def index
    @themes = Theme.published
  end

  def show
    @theme = Theme.friendly.find(params[:id])

    respond_to do |format|
      format.html
      format.email
    end
  end

  def home
    @theme = Theme.published.first
  end

  def email
    @theme = Theme.ready_for_email
    job = SendThemeAsEmail.new(@theme)
    job.run
    redirect_to root_path
  end
end

