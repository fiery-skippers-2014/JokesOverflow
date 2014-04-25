require 'spec_helper'


describe RepliesController do
  let(:joke) { FactoryGirl.create :joke }
  context "#index" do
    it "is succesful" do
      get :index, :joke_id => joke.id
      expect(response).to be_success
    end
    it "assigns reply to Reply.all" do
      get :index, :joke_id => joke.id
      expect(assigns(:replies)).to eq Reply.all
    end
  end

  context "#show" do
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

  context "#new" do
    it "is succesful" do
      get :new, :joke_id => joke.id
      expect(response).to be_success
    end
    it "assigns @reply to Reply.new" do
      get :new, :joke_id => joke.id
      expect(assigns(:reply)).to be_a_new Reply
    end
  end

  context "#create" do
    it "create a reply with valid attributes" do
      expect {
        post :create, :joke_id => joke.id, :reply => FactoryGirl.attributes_for(:reply)
      }.to change { Joke.count }.by(1)
      expect(response).to be_redirect
    end
  end

end

    # context "create" do
    #   let (:attributes) {FactoryGirl.attributes_for(:reply)}
    #   it "create a reply with valid attributes" do
    #     Reply.any_instance.stub(:save) {true}
    #     expect {
    #       post :create, :joke_id => joke.id, :reply => attributes
    #     }.to change { Reply.count }.by(1)
    #   end
    # end
