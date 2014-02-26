require 'spec_helper'

describe Theme do

    let! :theme_1 do
      Theme.create!(
        title: 'First Theme',
        issue_date: 1.day.ago,
        issue_number: 1,
        published: true
      )
    end

    let! :theme_2 do
      Theme.create!(
        title: 'Second Theme',
        issue_date: Time.now,
        issue_number: 2,
        published: true
      )
    end

    let! :theme_3 do
      Theme.create!(
        title: 'Third Theme',
        issue_date: Time.now,
        issue_number: 3,
        published: true
      )
    end

    let! :theme_5 do
      Theme.create!(
        title: 'Third Theme',
        issue_date: Time.now,
        issue_number: 5,
        published: true
      )
    end

  describe "#previous" do
    it "returns the previous theme" do
      expect(theme_2.previous).to eq theme_1
      expect(theme_3.previous).to eq theme_2
      expect(theme_5.previous).to eq theme_3
    end

    it "returns nil for the first theme" do
      expect(theme_1.previous).to be_nil
    end
  end

  describe "#next" do
    it "returns the next theme" do
      expect(theme_1.next).to eq theme_2
      expect(theme_2.next).to eq theme_3
      expect(theme_3.next).to eq theme_5
    end

    it "returns nil for the last theme" do
      expect(theme_5.next).to be_nil
    end
  end

end
