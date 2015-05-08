require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

describe('path to add new stylist', {:type => :feature}) do
  it('allows a salon owner to add a new stylist') do
    visit('/')
    click_link('ADD A STYLIST')
    fill_in('NAME', :with =>'George')
    click_button('ADD')
    click_link('HOME')
    expect(page).to have_content('George')
  end
end

describe('path to update stylist', {:type => :feature}) do
  it('allows a salon owner to update a stylist profile name') do
    visit('/')
    click_link('ADD A STYLIST')
    fill_in('NAME', :with =>'Jane')
    click_button('ADD')
    click_link('HOME')
    click_link('Jane')
    fill_in('change profile name', :with =>'Janie')
    click_button('UPDATE')
    click_link('HOME')
    expect(page).to have_content('Janie')
  end
end

describe('path to delete stylist', {:type => :feature}) do
  it('allows a salon owner to delete stylist') do
    visit('/')
    click_link('ADD A STYLIST')
    fill_in('NAME', :with =>'Mark')
    click_button('ADD')
    click_link('HOME')
    click_link('Mark')
    click_button('TERMINATE')
    expect(page).to have_content('CHANGES SAVED!')
  end
end

describe('path to add new client', {:type => :feature}) do
  it('allows a salon owner to add a new client') do
    visit('/')
    click_link('ADD A STYLIST')
    fill_in('NAME', :with =>'George')
    click_button('ADD')
    click_link('HOME')
    click_link('George')
    fill_in('ADD NEW CLIENT', :with =>'Mark')
    click_button('ADD')
    click_link('HOME')
    click_link('George')
    expect(page).to have_content('Mark')
  end
end

#integration spec should be getting 2 errors ("Capybara::Ambiguous:"). wasn't able to figure out issue in time
#decided to forego creating integration specs for updating/deleting client -- running out of time and they're practically the same for stylists!
