# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test 'should get index' do
    get events_url
    assert_response :success
  end

  test 'should get new' do
    get new_event_url
    assert_response :success
  end

  test 'should create event' do
    assert_difference('Event.count') do
      post events_url,
           params: {
             event: {
               attendee_list_id: @event.attendee_list_id,
               end_time: @event.end_time,
               event_id: @event.event_id,
               event_location: @event.event_location,
               event_title: @event.event_title,
               point_assess: @event.point_assess,
               start_time: @event.start_time
             }
           }
    end

    assert_redirected_to event_url(Event.last)
  end

  test 'should show event' do
    get event_url(@event)
    assert_response :success
  end

  test 'should get edit' do
    get edit_event_url(@event)
    assert_response :success
  end

  test 'should update event' do
    patch event_url(@event),
          params: {
            event: {
              attendee_list_id: @event.attendee_list_id,
              end_time: @event.end_time,
              event_id: @event.event_id,
              event_location: @event.event_location,
              event_title: @event.event_title,
              point_assess: @event.point_assess,
              start_time: @event.start_time
            }
          }
    assert_redirected_to event_url(@event)
  end

  test 'should destroy event' do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
