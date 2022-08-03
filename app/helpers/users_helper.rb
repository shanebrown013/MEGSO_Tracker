# frozen_string_literal: true

module UsersHelper
  # Returns true if the user is officer
  def is_officer?(user)
    user.is_officer?
  end

  def is_admin?(user)
    user.is_admin?
  end
end
