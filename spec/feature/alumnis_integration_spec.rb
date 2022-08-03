# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Add an Alumni', type: :feature do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'with valid inputs' do
		current_user = User.create!(first_name: 'first', last_name: 'last', email: ENV["GMAIL_USERNAME"], UID: 123456789, password: 'password', password_confirmation: 'password')
    visit root_path
		fill_in 'Email', with: current_user.email
		fill_in 'Password', with: current_user.password
		click_on 'Log in'
		visit events_path
		
		click_on 'Alumni'
		visit alumnis_path
		click_on 'Add Alumni'
		visit new_alumni_path
    fill_in 'Name', with: 'austin'
    fill_in 'LinkedIn URL', with: 'https://www.linkedin.com/in/austinptran'
    fill_in 'Graduation Year', with: '2022'
    fill_in 'Highest Position', with: 'President'
		
    click_on 'Create Alumni'
    visit alumnis_path
    expect(page).to have_content('austin')
    expect(page).to have_content('https://www.linkedin.com/in/austinptran')
    expect(page).to have_content('2022')
    expect(page).to have_content('President')
  end
end
