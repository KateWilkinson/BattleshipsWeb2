require 'spec_helper'

feature 'I want to be able to play the game' do

  scenario 'I want to be able to fire at a ship' do
    visit '/setup_game'
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

  scenario 'error message alert if invalid coordinate entered/ or coordinate is off board' do
    visit '/setup_game'
    fill_in('coord', with: 'A11')
    click_on 'Fire!'
    expect(page).to have_content 'Invalid coordinate'
  end

  scenario 'error message alert if the same coordinate entered' do
    visit '/setup_game'
    fill_in('coord', with: 'A5')
    click_on 'Fire!'
    fill_in('coord', with: 'A5')
    click_on 'Fire!'
    expect(page).to have_content 'Coordinate has been shot already'
  end

  scenario 'displays message when you have won the game' do
    visit '/setup_game'
    fill_in('coord', with: 'A1')
    click_on 'Fire!'
    fill_in('coord', with: 'A2')
    click_on 'Fire!'
    expect(page).to have_content 'You\'ve won the game!'
  end


end
