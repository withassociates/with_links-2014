require 'spec_helper'

describe ApplicationHelper do
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
      description: 'Google Dot Com Check It Out',
      icon_attribution: 'Icon by A Person from the Noun Project'
    )
  end

  describe "#link_unless_person_is_away" do
    it "returns 'is Away' if the person is away" do
      expect(helper.link_unless_person_is_away(link_away)).to eq("Calum is away")
    end

    it "returns the link if the person is not away" do
      expect(helper.link_unless_person_is_away(link_not_away)).to eq('<a href="http://www.google.com" target="_blank">Google</a>')
    end
  end

  describe "#icon_credit" do
    it "returns the suitcase icon credit if the person is away" do
      expect(helper.icon_credit(link_away)).to eq("Suitcase by Diego Naive from the Noun Project")
    end

    it "returns the uploaded icon credit if the person is away" do
      expect(helper.icon_credit(link_not_away)).to eq("Icon by A Person from the Noun Project")
    end
  end
end
