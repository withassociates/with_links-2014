require 'spec_helper'

describe LinksController do
  describe "#vote" do
    specify "it adds one to the vote count" do
      link = instance_double(Link)
      expect(link).to receive(:vote_up!)
      expect(Link).to receive(:find).with('1').and_return(link)

      get :vote, id: '1'
    end

    specify "a cookie is set" do
      link = instance_double(Link)
      expect(link).to receive(:vote_up!)
      expect(Link).to receive(:find).with('1').and_return(link)
      get :vote, id: '1'

      expect(response.cookies['done']).to eq("true")
    end

    specify "voting is disallowed if you have a cookie" do
      expect(Link).not_to receive(:find).with('1')
      request.cookies['done'] = 'true'
      get :vote, id: '1'
    end
  end
end
