class PeopleController < ApplicationController
  def index
    @with = Person.with_employee.alphabetical
    @guests = Person.guest.alphabetical
  end

  def show
    @person = Person.friendly.find(params[:id])
    @links = @person.links.by_issue.page(params[:page]).per(10)
  end
end
