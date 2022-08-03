# frozen_string_literal: true

json.extract! rewards_approval_list, :id, :reward_name, :UID, :created_at, :updated_at
json.url rewards_approval_list_url(rewards_approval_list, format: :json)
