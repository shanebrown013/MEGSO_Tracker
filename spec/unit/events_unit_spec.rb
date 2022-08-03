require 'rails_helper'

RSpec.describe Event, type: :model do
	subject do
		described_class.new(event_name: 'Event', event_point: 10, event_location: 'Location', event_date: '2022-01-01', event_start: '12:00', event_end: '22:00', event_verification: '123456', event_description: 'This is an event', event_attendee_list_id: 12)
	end
	
	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end
	
	it 'is not valid without an event name' do
		subject.event_name = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without points' do
		subject.event_point = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a date' do
		subject.event_date = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a start time' do
		subject.event_start = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without an end time' do
		subject.event_end = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a verification code' do
		subject.event_verification = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a description' do
		subject.event_description = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without an attendee list' do
		subject.event_attendee_list_id = nil
		expect(subject).not_to be_valid
	end

end