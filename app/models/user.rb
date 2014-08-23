class User < ActiveRecord::Base
  has_many :orders
  before_save { self.email = email.downcase }

  before_create :create_remember_token

  has_secure_password

  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  validates :first_name, presence: true, length: { maximum: 30 }

  validates :last_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def self.default_status
    self.status ||= "default"
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
