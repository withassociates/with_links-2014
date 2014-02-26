require 'spec_helper'

describe "themes/home.html.erb" do
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
    Link.create!(
      person_id: 1,
      theme_id: 1,
      url: 'http://www.google.com',
      title: 'A Link In Theme One',
      description: 'This is a link in theme one'
    )
    Link.create!(
      person_id: 1,
      theme_id: 2,
      url: 'http://www.facebook.com',
      title: 'A Link In Theme Two',
      description: 'This is a link in theme two'
    )
  end

  it "displays the latest theme and its links" do
    visit '/'
    expect(page).to have_content('A Link In Theme Two')
    expect(page).to_not have_content('A Link In Theme One')
  end
end
