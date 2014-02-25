require 'spec_helper'

describe "themes/show.html.erb" do
  before do
    Person.create!(name: 'Calum')
    Theme.create!(
      title: 'With Links Theme',
      issue_number: 01,
      published: true
    )
    Link.create!(
      person_id: 1,
      theme_id: 1,
      url: 'http://www.google.com',
      title: 'First Link',
      description: 'A link on a Theme page'
    )
  end

  it "displays the links in a theme" do
    visit '/themes/with-links-theme'

    page.should have_content('With Links Theme')
    page.should have_content('First Link')
    page.should have_content('A link on a Theme page')
  end
end
