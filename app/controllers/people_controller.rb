class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.friendly.find(params[:id])
  end
end
