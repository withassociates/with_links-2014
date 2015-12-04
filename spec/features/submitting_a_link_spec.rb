require 'spec_helper'

describe "submitting a link" do
  let! :theme do
    Theme.create!(title: 'Examples')
  end

  let! :alice do
    Person.create!(name: 'Alice')
  end

  it "adds the link to current theme" do
    visit '/submit'

    expect(page).to have_content 'Examples'

    select 'Alice', from: 'Who are you?'
    fill_in 'URL', with: 'http://example.com'
    fill_in 'Title', with: 'Example'
    fill_in 'Description', with: 'Some kind of website.'
    click_on 'Submit'

    link = theme.reload.links.first

    expect(link).not_to be_nil
    expect(link.person).to eq(alice)
    expect(link.url).to eq('http://example.com')
    expect(link.title).to eq('Example')
    expect(link.description).to eq('Some kind of website.')
  end
end
