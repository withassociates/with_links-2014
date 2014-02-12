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

  it "displays the home page and allows one vote" do
    visit '/'

    expect(page).to have_content("Theme 1: Testing")
    expect(page).to have_content("Calum")
    expect(page).to have_content("Joseph")

    # Vote for link
    expect(page).to have_content("Vote for this With Link!")

    within("#link_#{link.id}") do
      click_link("Vote for this With Link!")
      # expect(page).to have_content("1 vote for the With Link")
      # expect(page).to_not have_content("Vote for this With Link!")
    end

    link.reload
    expect(link.votes).to eq(1)
  end
end

