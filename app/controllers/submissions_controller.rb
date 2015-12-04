class SubmissionsController < ApplicationController
  layout 'submissions'

  def new
    @theme = Theme.current
    @link = @theme.links.new
  end

  def create
    @theme = Theme.current
    @link = @theme.links.new(link_params)

    if @link.save
      redirect_to submission_thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def link_params
    params.require(:link).permit(:person_id, :url, :title, :description)
  end
end
