# frozen_string_literal: true

json.array!(@attendee_lists, partial: 'attendee_lists/attendee_list', as: :attendee_list)
