require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  background do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email',	with: 'matiakaweesi@gmail.com'
    fill_in 'Password',	with: '111111'
    fill_in 'Password confirmation',	with: '111111'
    click_button 'Sign up'
  end

  scenario 'Welcome! You have signed up successfully.' do
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'Add a new category for the app' do
    click_link 'Add a new category'
    fill_in 'Category Name', with: 'spices'
    attach_file('Image or Icon', 'app/assets/images/mugandbean.jpg')
    find('input[name="commit"]').click
    expect(page).to have_content('spices')
    expect(page).to have_button('Logout')
  end

  scenario 'traverse to the created category page' do
    click_link 'Add a new category'
    fill_in 'Category Name', with: 'foods'
    attach_file('Image or Icon', 'app/assets/images/mugandbean.jpg')
    find('input[name="commit"]').click
    click_link 'foods'
    expect(page).to have_content('$')
    expect(page).to have_content('Delete')
  end

  scenario 'add  a new category transaction for the app' do
    click_link 'Add a new category'
    fill_in 'Category Name', with: 'vegetables'
    attach_file('Image or Icon', 'app/assets/images/mugandbean.jpg')
    find('input[name="commit"]').click
    click_link 'vegetables'
    click_link 'Add Transaction'
    fill_in 'transaction[name]', with: 'vegetables'
    fill_in 'Amount', with: '800'
    select 'vegetables'
    find('input[name="commit"]').click
    expect(page).to have_content('Transaction was successfully created')
  end
end
