# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Add an Event', type: :feature do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'with valid inputs' do
		current_user = User.create!(first_name: 'first', last_name: 'last', email: ENV["GMAIL_USERNAME"], UID: 123456789, password: 'password', password_confirmation: 'password')
    visit root_path
		fill_in 'Email', with: current_user.email
		fill_in 'Password', with: current_user.password
		click_on 'Log in'
		visit events_path
		
		click_on 'New Event'
		visit new_event_path
    fill_in 'Event Name', with: 'Event'
    fill_in 'Amount of Points', with: '20'
    fill_in 'Event Location', with: 'ZACH'
		select '2022', :from => 'event_event_date_1i'
		select 'July', :from => 'event_event_date_2i'
		select '1', :from => 'event_event_date_3i'
		select '12', :from => 'event_event_start_4i'
		select '00', :from => 'event_event_start_5i'
		select '20', :from => 'event_event_end_4i'
		select '00', :from => 'event_event_end_5i'
		fill_in 'Event Verification Code', with: '109839'
		fill_in 'Event Description', with: 'Description'
		
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Event')
    expect(page).to have_content('20')
    expect(page).to have_content('ZACH')
		expect(page).to have_content('Friday, July 01, 2022')
		expect(page).to have_content('12:00PM')
		expect(page).to have_content('8:00PM')
		expect(page).to have_content('109839')
  end
end
