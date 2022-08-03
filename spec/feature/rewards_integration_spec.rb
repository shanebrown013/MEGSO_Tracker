# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Add a Reward', type: :feature do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'with valid inputs' do
		current_user = User.create!(first_name: 'first', last_name: 'last', email: ENV["GMAIL_USERNAME"], UID: 123456789, password: 'password', password_confirmation: 'password')
    visit root_path
		fill_in 'Email', with: current_user.email
		fill_in 'Password', with: current_user.password
		click_on 'Log in'
		visit events_path
		
		click_on 'Rewards'
		visit rewards_path
		click_on 'New Reward'
		visit new_reward_path
    fill_in 'Reward Name', with: 'Reward'
    fill_in 'Points Required', with: '10'
    fill_in 'Reward Description', with: 'This is a reward'
	
    click_on 'Create Reward'
    visit rewards_path
    expect(page).to have_content('Reward')
    expect(page).to have_content('10')
  end
end
