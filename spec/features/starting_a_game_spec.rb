require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'I can enter my name' do
    visit '/new_game'
    fill_in 'Michael'
    click_on 'submit'
    expect(page).to have_content 'You are now registered!'

  end
end
