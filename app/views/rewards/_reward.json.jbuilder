# frozen_string_literal: true

json.extract!(reward, :id, :reward_name, :reward_points, :created_at, :updated_at)
json.url(reward_url(reward, format: :json))
