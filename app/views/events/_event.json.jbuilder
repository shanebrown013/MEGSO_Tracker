# frozen_string_literal: true

json.extract!(event, :id, :event_name, :event_point, :event_location, :event_date, :event_start, :event_end, :event_verification,
              :event_attendee_list_id, :created_at, :updated_at)
json.url(event_url(event, format: :json))
