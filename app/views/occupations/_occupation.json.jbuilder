# frozen_string_literal: true

json.extract!(occupation, :id, :occupation_role, :occupation_company, :occupation_location, :created_at, :updated_at)
json.url(occupation_url(occupation, format: :json))
