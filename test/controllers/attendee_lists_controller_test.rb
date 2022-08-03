# frozen_string_literal: true

require 'test_helper'

class AttendeeListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendee_list = attendee_lists(:one)
  end

  test 'should get index' do
    get attendee_lists_url
    assert_response :success
  end

  test 'should get new' do
    get new_attendee_list_url
    assert_response :success
  end

  test 'should create attendee_list' do
    assert_difference('AttendeeList.count') do
      post attendee_lists_url,
           params: {
             attendee_list: {
               UID: @attendee_list.UID,
               attendee_list_id: @attendee_list.attendee_list_id,
               compound_key: @attendee_list.compound_key
             }
           }
    end

    assert_redirected_to attendee_list_url(AttendeeList.last)
  end

  test 'should show attendee_list' do
    get attendee_list_url(@attendee_list)
    assert_response :success
  end

  test 'should get edit' do
    get edit_attendee_list_url(@attendee_list)
    assert_response :success
  end

  test 'should update attendee_list' do
    patch attendee_list_url(@attendee_list),
          params: {
            attendee_list: {
              UID: @attendee_list.UID,
              attendee_list_id: @attendee_list.attendee_list_id,
              compound_key: @attendee_list.compound_key
            }
          }
    assert_redirected_to attendee_list_url(@attendee_list)
  end

  test 'should destroy attendee_list' do
    assert_difference('AttendeeList.count', -1) do
      delete attendee_list_url(@attendee_list)
    end

    assert_redirected_to attendee_lists_url
  end
end
