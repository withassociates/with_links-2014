require 'spec_helper'

describe "themes/view.html.erb" do
  before do
    Person.create!(name: 'Calum')
    Theme.create!(
      title: 'First Theme',
      issue_number: 01,
      published: true
    )
    Theme.create!(
      title: 'Second Theme',
      issue_number: 02,
      published: true
    )
    Theme.create!(
      title: 'Unpublished Theme',
      issue_number: 03,
      published: false
    )
  end

  it "displays a list of published Themes" do
    visit '/themes/view'

    page.should have_content('First Theme')
    page.should have_content('Second Theme')
    page.should_not have_content('Unpublished Theme')
  end
end
