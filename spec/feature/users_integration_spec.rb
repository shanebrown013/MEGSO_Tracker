# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Add a User', type: :feature do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'with valid inputs' do
		current_user = User.create!(first_name: 'First', last_name: 'Last', email: 'email@email.com', UID: 123123123, password: 'password', password_confirmation: 'password')
    visit root_path
		fill_in 'Email', with: current_user.email
		fill_in 'Password', with: current_user.password
		click_on 'Log in'
		visit events_path

		click_on 'First\'s Account'
		visit account_user_path(id: current_user.id)
    expect(page).to have_content('First')
    expect(page).to have_content('Last')
    expect(page).to have_content('email@email.com')
		expect(page).to have_content(123123123)

  end
end
