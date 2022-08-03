# frozen_string_literal: true

class User < ApplicationRecord
  # validates :first_name, :last_name, :email, :UID, :password, :password_confirmation, presence: true
  after_initialize :set_defaults, unless: :persisted?

  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :UID, presence: true, uniqueness: true, length: { minimum: 9, maximum: 9 }, numericality: { only_integer: true }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def set_defaults
    self.points ||= 0
    self.rewards_earned ||= 0
    self.is_officer ||= false
    self.position ||= 'Member'
    self.officer_apply ||= false
    if email == ENV["GMAIL_USERNAME"]
      self.is_admin = true
      self.is_officer = true
      self.position = 'Officer'
    else
      self.is_admin = false
    end
  end
end
