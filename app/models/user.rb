class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
 # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # VALID_EMAIL_REGEX = ^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$
  VALID_EMAIL_REGEX = /.+@.+/
  validates_presence_of :email
  validates_format_of   :email, with: VALID_EMAIL_REGEX
  validates             :email, uniqueness: true

  validates_presence_of :usertype

# validates :email, presence: true, length: { maximum: 255 },
#                   format: { with :VALID_EMAIL_REGEX },
#                   uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
