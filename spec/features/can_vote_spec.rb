require 'spec_helper'

feature 'can create a new vote'  do
  context 'from the home page' do
  let(:vote) {FactoryGirl.create (:vote)}
  let(:joke) {FactoryGirl.attributes_for (:joke)}
  it 'change vote count by one' do
      visit root_path
      click_on 'New Joke'
      fill_in 'joke[title]', :with => joke[:title]
      click_on 'Create Joke'
      expect {
      click_on 'Up'
       }.to change(Vote, :count).by(1)
    end

  it 'subjects vote count by one' do
      visit root_path
      click_on 'New Joke'
      fill_in 'joke[title]', :with => joke[:title]
      click_on 'Create Joke'
      click_on 'Up'
      expect {
      click_on 'Down'
       }.to change(Vote, :count).to eq(0)
    end
  end




end