# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  helper_method :authorize_user

  def authorize_user
      redirect_to root_url unless logged_in?
  end
end
