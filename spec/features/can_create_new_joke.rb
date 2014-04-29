require 'spec_helper'

feature 'can create new joke'  do
  context 'from the home page' do
    let(:joke) {FactoryGirl.attributes_for (:joke)}
    it 'create a new joke' do
      visit root_path
      click_on 'New Joke'
      fill_in 'joke[title]', :with => joke[:title]
      click_on 'Create Joke'
      page.should have_content joke[:title]
    end

    it 'doesn\'t create two of the same jokes' do
      visit root_path
      click_on 'New Joke'
      fill_in 'joke[title]', :with => "bob"
      click_on 'Create Joke'
      click_on 'New Joke'
      fill_in 'joke[title]', :with => "bob"
      click_on 'Create Joke'
      page.should have_content "Create New Joke"
    end


    it 'change joke count by one' do
      expect {
        visit root_path
        click_on 'New Joke'
        fill_in 'joke[title]', :with => joke[:title]
        click_on 'Create Joke'
       }.to change(Joke, :count).by(1)
    end

    it 'you can click on each joke' do
      visit root_path
      click_on 'New Joke'
      fill_in 'joke[title]', :with => "Fake Joke"
      click_on 'Create Joke'
      click_on 'Fake Joke'
      page.should have_content 'Fake Joke'
    end

  end



end
