class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.friendly.find(params[:id])
    @links = Link.where(person: @person).page(params[:page])
  end
end
