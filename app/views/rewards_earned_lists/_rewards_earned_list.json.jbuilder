json.extract! rewards_earned_list, :id, :reward_name, :UID, :created_at, :updated_at
json.url rewards_earned_list_url(rewards_earned_list, format: :json)
