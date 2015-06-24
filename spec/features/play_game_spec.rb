require 'spec_helper'

feature 'I want to be able to play the game' do

  scenario 'I want to be able to fire at a ship' do
    visit '/play_game'
    expect(page).to have_content 'Enter the coordinate you want to shoot at'
  end

  scenario 'I want to be told if I\'ve hit a ship' do
    visit '/setup_game'
    fill_in('coord', with: 'A1')
    click_on 'Fire!'
    expect(page).to have_content 'hit'
  end

  scenario 'I want to be told if I\'ve missed a ship' do
    visit '/setup_game'
    fill_in('coord', with: 'B1')
    click_on 'Fire!'
    expect(page).to have_content 'miss'
  end

  scenario 'I want to be able to keep firing at coordinates once I hit or miss' do
    visit '/play_game'
    fill_in('coord', with: 'A1')
    expect(page).to have_content 'Enter the coordinate you want to shoot at'
  end

end