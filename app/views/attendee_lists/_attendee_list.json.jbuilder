# frozen_string_literal: true

json.extract!(attendee_list, :id, :compound_key, :attendee_list_id, :UID, :created_at, :updated_at)
json.url(attendee_list_url(attendee_list, format: :json))
