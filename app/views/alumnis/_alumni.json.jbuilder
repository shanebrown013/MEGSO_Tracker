# frozen_string_literal: true

json.extract!(alumni, :id, :first_name, :last_name, :LinkedIn, :alumni_occupation, :alumni_grad_year, :created_at, :updated_at)
json.url(alumni_url(alumni, format: :json))
