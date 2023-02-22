require 'rails_helper'

RSpec.feature 'Splash Screen', type: :feature do
  background do
    visit root_path
  end

  scenario 'display splash screen' do
    expect(page).to have_content('Budget App')
  end

  scenario 'display splash screen' do
    expect(page).to have_content('Log-in')
  end

  scenario 'display splash screen' do
    expect(page).to have_content('Sign up')
  end
end
