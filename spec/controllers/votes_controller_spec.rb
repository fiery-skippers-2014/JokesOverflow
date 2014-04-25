require 'spec_helper'

describe JokesController do
   context "new" do
    it "assigns @vote to a new joke" do
      get :new
      expect(assigns(:joke)).to be_a_new Joke
    end


    it 'assigns jokes to all jokes' do
      get :index
      expect(assigns(:jokes)).to eq Joke.all
    end
  end
end
