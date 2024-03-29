class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save { self.email = email.downcase }
  before_create :create_activation_digest

  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # VALID_EMAIL_REGEX = ^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$
  # VALID_EMAIL_REGEX = /.+@.+/
  validates_presence_of :email
  validates_format_of   :email, with: VALID_EMAIL_REGEX
  validates_uniqueness_of :email, :case_sensitive => false

  validates_presence_of :usertype

  #  THIS IS NOT WORKING:
  # validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with :VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false }


  # This will break test/models/user_test.rb
  has_secure_password


  # THIS BREAKS UPDATES WITHOUT PASSWORD, Need to think of another way:
  # validates :password, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine::cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token:
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

# def authenticated?(remember_token)
#   if remember_digest.nil?
#     false
#   else
#     BCrypt::Password.new(remember_digest).is_password?(remember_token)
#   end
# end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
end
