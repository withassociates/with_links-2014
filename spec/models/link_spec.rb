require 'spec_helper'

describe Link do
  context "#vote_up!" do
    it "increments the votes" do
      link = Link.new
      link.vote_up!
      expect(link.votes).to eq(1)
    end
  end
end
