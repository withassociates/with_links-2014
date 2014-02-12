require 'spec_helper'

describe ApplicationHelper do
  describe "#link_unless_person_is_away" do
    let! :calum do
      Person.create!(name: 'Calum')
    end

    let! :theme do
      Theme.create!(
        title: 'Test Linx',
        issue_number: 02,
        published: true
      )
    end

    let! :link_away do
      Link.create!(
        person: calum,
        is_away: true,
        theme: theme
      )
    end

    let! :link_not_away do
      Link.create!(
        person: calum,
        theme: theme,
        url: 'http://www.google.com',
        title: 'Google',
        description: 'Google Dot Com Check It Out'
      )
    end

    it "returns 'is Away' if the person is away" do
      helper.link_unless_person_is_away(link_away).should eq("is Away")
    end

    it "returns the link if the person is not away" do
      helper.link_unless_person_is_away(link_not_away).should eq('<a href="http://www.google.com">Google</a>')
    end
  end
end
