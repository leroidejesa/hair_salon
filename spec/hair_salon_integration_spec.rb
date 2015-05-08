require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

describe('path to add new stylist', {:type => :feature}) do
  it('allows a salon owner to add a new stylist') do
    visit('/')
    click_link('ADD A STYLIST')
    fill_in('stylist_name', :with =>'George')
    click_button('ADD')
    click_link('HOME')
    expect(page).to have_content('George')
  end
end

describe('path to update stylist', {:type => :feature}) do
  it('allows a salon owner to update a stylist profile name') do
    visit('/')
    click_link('ADD A STYLIST')
    fill_in('stylist_name', :with =>'George')
    click_button('ADD')
    click_link('HOME')
    click_link('George')
    fill_in('change profile name', :with =>'Georgie')
    click_button('UPDATE')
    click_link('HOME')
    expect(page).to have_content('Georgie')
  end
end

describe('path to update stylist', {:type => :feature}) do
  it('allows a salon owner to update a stylist profile name') do
    visit('/')
    click_link('ADD A STYLIST')
    fill_in('stylist_name', :with =>'George')
    click_button('ADD')
    click_link('HOME')
    click_link('George')
    click_button('TERMINATE')
    expect(page).to have_content('CHANGES SAVED!')
  end
end

#add client

#delete client
