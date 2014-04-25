require 'spec_helper'

describe JokesController do
  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end

    it 'assigns jokes to all jokes' do
      get :index
      expect(assigns(:jokes)).to eq Joke.all
    end

    it 'assigns a new vote' do
      get :index
      expect(assigns(:vote)).to be_a_new Vote
    end
  end

  context "#show" do
    let(:joke) { FactoryGirl.create :joke }
    it "is successful" do
      get :show, :id => joke.id
      expect(response).to be_success
    end
    it "assigns @joke to the joke found by id" do
      get :show, :id => joke.id
      expect(assigns(:joke)).to eq joke
    end
  end

  context "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
    it "assigns @joke to a new joke" do
      get :new
      expect(assigns(:joke)).to be_a_new Joke
    end


    context "create" do
      it "creates with valid attributes" do
        expect {
          post :create, :joke => FactoryGirl.attributes_for(:joke)
        }.to change { Joke.count }.by(1)
        expect(response).to be_redirect
      end
      it "doesnt create with invalid attr" do
        expect {
          post :create
        }.not_to change { Joke.count }
        expect(response).not_to be_redirect
      end
    end
  end





end
