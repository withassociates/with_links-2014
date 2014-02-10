class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def vote
    unless cookies[:done]
      @link = Link.find(params[:id])
      @link.vote_up!
      cookies[:done] = { value: true, expires: 2.days.from_now }
    end
    redirect_to root_path
  end

  def top
    @top_links = Link.top_10
  end
end
