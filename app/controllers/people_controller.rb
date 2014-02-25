class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.friendly.find(params[:id])
    @links = Link.where(person: @person).paginate(page: params[:page], per_page: 10)
  end
end
