require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    fill_in('name', :with => 'Ana')
    click_button 'Submit'
    expect(current_url).to include 'name=Ana'
  end
  scenario 'I leave my name blank' do
    visit '/'
    click_link 'New Game'
    fill_in('name', :with => '')
    click_button 'Submit'
    expect(page).to have_content 'YOU MUST GIVE A NAME'
  end
  scenario 'It prints my board' do
    visit '/board?name=Ana'
    expect(page).to have_content 'here is your board:'
  end
end
