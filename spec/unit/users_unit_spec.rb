require 'rails_helper'

RSpec.describe User, type: :model do
	subject do
		described_class.new(first_name: 'First', last_name: 'Last', email: 'email@email.com', UID: '123123123', password: 'password', password_confirmation: 'password')
	end
	
	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end
	
	it 'is not valid without a first name' do
		subject.first_name = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a last name' do
		subject.last_name = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without an email' do
		subject.email = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a UID' do
		subject.UID = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a password' do
		subject.password = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a password confirmation' do
		subject.password_confirmation = nil
		expect(subject).not_to be_valid
	end


end