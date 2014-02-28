class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.friendly.find(params[:id])
    @links = @person.links_ordered_by_issue.page(params[:page]).per(10)
  end
end
