# frozen_string_literal: true

module EventsHelper
  # Returns the user's name
  def get_current_user_first_name(uid)
    @user = User.find_by(UID: uid)
    @first_name = @user.first_name
  end
end
