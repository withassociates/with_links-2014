require 'spec_helper'

describe "Home page" do
  let! :calum do
    Person.create!(name: 'Calum')
  end

  let! :theme do
    Theme.create!(
      title: 'Testing',
      issue_number: 01,
      published: true
    )
  end

  let! :link do
    Link.create!(
      person: calum,
      is_away: false,
      theme: theme,
      url: 'http://www.withassociates.com',
      title: 'With Associates',
      description: 'Link description'
    )
  end

  before do
    person = Person.create!(name: 'Joseph')
    Link.create!(
      person: person,
      is_away: false,
      theme: theme,
      url: 'http://www.google.com',
      title: 'Google Link',
      description: 'Link 2 description'
    )
  end

  it "displays the latest theme" do
    visit '/'

    expect(page).to have_text("Testing")
    expect(page).to have_text("Calum")
    expect(page).to have_text("Joseph")
  end
end

