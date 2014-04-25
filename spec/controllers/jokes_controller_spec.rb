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
  end

  context "#show" do
    let(:joke) { FactoryGirl.create :joke }
    it "is successful" do
      get :show, :id => joke.id
      expect(response).to be_success
    end
  end
end
