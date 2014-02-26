require 'spec_helper'

describe "themes/show.html.erb" do
  before do
    Person.create!(name: 'Calum')
    Person.create!(name: 'Anna')
    Theme.create!(
      title: 'With Links Theme',
      issue_number: 01,
      published: true
    )
    Link.create!(
      sort_order: 1,
      person_id: 1,
      theme_id: 1,
      url: 'http://www.google.com',
      title: 'First Link',
      description: 'A link on a Theme page'
    )
    Link.create!(
      sort_order: 2,
      person_id: 2,
      theme_id: 1,
      url: 'http://www.google.net',
      title: 'Second Link'
    )
  end

  it "displays the links in a theme" do
    visit '/themes/with-links-theme'

    expect(page).to have_content('With Links Theme')
    expect(page).to have_content('First Link')
    expect(page).to have_content('A link on a Theme page')
  end
end
