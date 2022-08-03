require 'rails_helper'

RSpec.describe Alumni, type: :model do
	subject do
		described_class.new(alumni_name: 'Austin', LinkedIn: 'https://www.linkedin.com/in/austinptran', alumni_grad_year: 2022, highest_position: 'President')
	end
	
	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end

	it 'is not valid without a Name' do
		subject.alumni_name = nil
		expect(subject).not_to be_valid
	end
	
	it 'is not valid without a LinkedIn URL' do
		subject.LinkedIn = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a graduation year' do
		subject.alumni_grad_year = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a position' do
		subject.highest_position = nil
		expect(subject).not_to be_valid
	end


end