require 'spec_helper'


describe RepliesController do
  let(:joke) { FactoryGirl.create :joke }
  context "index" do
    it "is succesful" do
      get :index, :joke_id => joke.id
      expect(response).to be_success
    end
    it "assigns reply to Reply.all" do
      get :index, :joke_id => joke.id
      expect(assigns(:replies)).to eq Reply.all
    end

    context "show" do
      let(:reply) {FactoryGirl.create :reply}
      it "is succesful" do
        get :show, :id => reply.id, :joke_id => joke.id
        expect(response).to be_success
      end
      it "assigns @reply to the reply found by that id" do
        get :show, :id => reply.id, :joke_id => joke.id
        expect(assigns(:reply)).to eq reply
      end
    end
  end

end

