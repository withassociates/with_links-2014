class LinkCategoriesController < ApplicationController
  def index
    @link_categories = LinkCategory.alphabetical
  end

  def show
    @category = LinkCategory.friendly.find(params[:id])
    @links = Link.where(link_category: @category)
  end
end
