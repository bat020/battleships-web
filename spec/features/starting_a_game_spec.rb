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
    expect(page).to have_css 'div#b0ard'
  end
end

feature 'Lets you fire at the board' do
  scenario 'I\'m asked for coordinates' do
    visit '/board?name=Ana'
    expect(page).to have_css 'form#sh0tForm'
  end

  scenario 'Remembers my name when I\'ve clicked Shoot.' do
    visit '/board?name=Ana'
    fill_in('coord', :with => 'A1')
    click_button 'Shoot'
    expect(page).to have_content 'Hello Ana'
  end

  scenario 'Udpates the board with shot location.' do
    visit '/board?name=Ana'
    fill_in('coord', :with => 'A1')
    click_button 'Shoot'
    expect(page.text).to match (/ 1 [mx]/)
  end

end
