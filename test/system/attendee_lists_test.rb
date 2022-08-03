# frozen_string_literal: true

require 'application_system_test_case'

class AttendeeListsTest < ApplicationSystemTestCase
  setup do
    @attendee_list = attendee_lists(:one)
  end

  test 'visiting the index' do
    visit attendee_lists_url
    assert_selector 'h1', text: 'Attendee Lists'
  end

  test 'creating a Attendee list' do
    visit attendee_lists_url
    click_on 'New Attendee List'

    fill_in 'Uid', with: @attendee_list.UID
    fill_in 'Attendee list', with: @attendee_list.attendee_list_id
    fill_in 'Compound key', with: @attendee_list.compound_key
    click_on 'Create Attendee list'

    assert_text 'Attendee list was successfully created'
    click_on 'Back'
  end

  test 'updating a Attendee list' do
    visit attendee_lists_url
    click_on 'Edit', match: :first

    fill_in 'Uid', with: @attendee_list.UID
    fill_in 'Attendee list', with: @attendee_list.attendee_list_id
    fill_in 'Compound key', with: @attendee_list.compound_key
    click_on 'Update Attendee list'

    assert_text 'Attendee list was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Attendee list' do
    visit attendee_lists_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Attendee list was successfully destroyed'
  end
end
