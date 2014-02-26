require 'spec_helper'

describe "people/show.html.erb" do
  before do
    Person.create!(name: 'Calum')
    Theme.create!(
      title: 'Theme 1',
      issue_number: 1,
      published: true
    )
    Theme.create!(
      title: 'Theme 2',
      issue_number: 2,
      published: true
    )
    Link.create!(
      person_id: 1,
      theme_id: 1,
      url: 'http://www.google.com',
      title: 'Link in first Theme',
      description: 'Hello'
    )
    Link.create!(
      person_id: 1,
      theme_id: 2,
      url: 'http://www.facebook.com',
      title: 'Link in second Theme',
      description: 'Goodbye'
    )
  end

  it "displays a person's links" do
    visit '/people/calum'

    expect(page).to have_content("Calum's Links")
    expect(page).to have_content("Link in first Theme")
    expect(page).to have_content("Link in second Theme")
    expect(page).to have_content("Hello")
    expect(page).to have_content("Goodbye")
  end
end
