require 'spec_helper'

describe "people/show.html.erb" do
  let :person do
    Person.create!(name: 'Calum')
  end

  let! :link_1 do
    theme = Theme.create!(
      title: 'Theme 1',
      issue_number: 1,
      published: true
    )

    Link.create!(
      person: person,
      theme: theme,
      url: 'http://www.google.com',
      title: 'Link in first Theme',
      description: 'Hello'
    )
  end

  let! :link_2 do
    theme = Theme.create!(
      title: 'Theme 2',
      issue_number: 2,
      published: true
    )
    Link.create!(
      person: person,
      theme: theme,
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

  it "displays a person's links in desc order of their theme" do
    visit '/people/calum'

    expect(page).to have_selector("ul li#link_#{link_2.id}:nth-child(1)")
    expect(page).to have_selector("ul li#link_#{link_1.id}:nth-child(2)")
  end
end
