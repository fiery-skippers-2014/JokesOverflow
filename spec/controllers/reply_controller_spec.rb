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


  context "create" do
    let (:attributes) {FactoryGirl.attributes_for(:reply)}
    it "creates with valid attributes" do
      expect {
        post :create, :joke_id => joke.id, :reply => attributes
      }.to change { Reply.count }.by(1)
      expect(response).to be_redirect
    end
    it "doesnt create with invalid attr" do
      expect {
        post :create, :joke_id => joke.id, :reply => {}
      }.not_to change { Reply.count }
      expect(response).not_to be_redirect
    end
  end

  # unsuccesful but useful stub attempts
  # context "create" do
  #   let (:attributes) {FactoryGirl.attributes_for(:reply)}
  #   it "create a reply with valid attributes" do
  #     Reply.any_instance.stub(:save) {true}
  #     post :create, :joke_id => joke.id, :reply => attributes
  #     # expect {
  #     # }
  #     expect(response).to be_redirect
  #   end

  #   it "doesn't create a reply with invalid attributes" do
  #      Reply.any_instance.stub(:save) {false}
  #      expect {
  #       post :create, :joke_id => joke.id, :reply => attributes
  #     }.not_to change { Reply.count }
  #   end
  # end

end

