require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    expect(page).to have_selector('#button')
    click_link 'Register to play'
    expect(page).to have_content "What's your name, new player?"
  end

  scenario 'I can enter my name' do
    visit '/new_game'
    fill_in('name', with: 'Kate')
    click_on 'Submit'
    expect(page).to have_content 'You are now registered to play, Kate!'

  end

  scenario 'I can click a link to start the game' do
    visit '/new_game'
    fill_in('name', with: 'Kate')
    click_on 'Submit'
    click_link 'Begin your adventure'
    expect(page).to have_content 'Enter the coordinate you want to shoot at'
  end

end
