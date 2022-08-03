# frozen_string_literal: true

class Event < ApplicationRecord
  validates :event_name, :event_location, :event_date, :event_start, :event_end, :event_verification, :event_attendee_list_id, :event_description,
            presence: true, length: { minimum: 2, maximum: 50 }
  validates :event_point, presence: true
  # validates :event_verification, numericality: { only_integer: true }
end
