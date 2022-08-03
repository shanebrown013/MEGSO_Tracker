# frozen_string_literal: true

module RewardsHelper
  # Returns the user's name
  def get_current_user_points(uid)
    @user = User.find_by(UID: uid)
    @points = @user.points
  end

  def get_current_user_first_name(uid)
    @user = User.find_by(UID: uid)
    @first_name = @user.first_name
  end

  def get_current_user_last_name(uid)
    @user = User.find_by(UID: uid)
    @last_name = @user.last_name
  end

  def get_current_user_email(uid)
    @user = User.find_by(UID: uid)
    @email = @user.email
  end
end
