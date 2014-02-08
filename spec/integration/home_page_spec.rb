require 'spec_helper'

describe "home page" do
  before do
    Person.create!(name: 'Calum')
    Person.create!(name: 'Joseph')
    Theme.create!(
      title: 'Testing',
      issue_number: 01,
      published: true
    )
    Link.create!(
      person_id: 1,
      theme_id: 1,
      url: 'http://www.withassociates.com',
      title: 'With Associates',
      description: 'Link description'
    )
    Link.create!(
      person_id: 2,
      theme_id: 1,
      url: 'http://www.google.com',
      title: 'Google Link',
      description: 'Link 2 description'
    )
  end

  it "should display the latest theme" do
    visit '/'

    expect(page).to have_content("Theme 1: Testing")
    expect(page).to have_content("Calum")
    expect(page).to have_content("Joseph")
  end
end
