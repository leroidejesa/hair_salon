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
