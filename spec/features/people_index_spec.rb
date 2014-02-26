require 'spec_helper'

describe "people/index.html.erb" do
  before do
    Person.create!(name: 'Calum')
    Person.create!(name: 'Erin')
    Person.create!(name: 'Jamie')
  end

  it "should display each person" do
    visit "/people"

    expect(page).to have_content('Calum')
    expect(page).to have_content('Erin')
    expect(page).to have_content('Jamie')
  end
end
