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

  # context "#show" do
  #   let(:joke) { FactoryGirl.create :joke }
  #   get :show, :id => joke.id
  #   expect(assigns(:joke)).to eq joke
  # end
end
