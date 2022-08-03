# frozen_string_literal: true

class Alumni < ApplicationRecord
  validates :alumni_name, :LinkedIn, :alumni_grad_year, :highest_position, presence: true, length: { minimum: 2, maximum: 100 }
  # URL_REGEXP = /\A(http|https):\/\/[www\.]+([linkedin.com]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  # URL_REGEXP = /\A(http|https):\/\/([\w]+\.]{1}linkedin+)*\.com{2,5}({1,5})?(\/.*)?\z/ix
  # URL_REGEXP = /https?:\/\/(?:\.be\/|(?:[a-z]{2,3}\.)?youtube\.com\/watch(?:\?|#\!)v=)([\w-]{11}).*/gi
  # URL_REGEXP = /\A(http\https):\/\/(www\.)?linkedin.com\/in\/(?P<permalink>[\w\-\_À-ÿ%]+)\/?
  URL_REGEXP = %r{\Ahttps://(www\.)?linkedin.com/in/[-_a-z0-9]{3,}(/)*\z}
  validates :LinkedIn, format: { with: URL_REGEXP, message: 'You provided invalid LinkedIn URL' }
end
