require 'spec_helper'

describe "Viewing the /themes page" do
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
    visit '/themes'

    expect(page).to have_content('First Theme')
    expect(page).to have_content('Second Theme')
    expect(page).to_not have_content('Unpublished Theme')
  end
end
