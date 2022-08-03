require 'rails_helper'

RSpec.describe Reward, type: :model do
	subject do
		described_class.new(reward_name: 'Reward', reward_points: 10, reward_description: 'This is a reward')
	end
	
	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end
	
	it 'is not valid without a reward name' do
		subject.reward_name = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without reward points' do
		subject.reward_points = nil
		expect(subject).not_to be_valid
	end

	it 'is not valid without a description' do
		subject.reward_description = nil
		expect(subject).not_to be_valid
	end


end