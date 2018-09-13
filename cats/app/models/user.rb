class User < ApplicationRecord
  after_initialize :ensure_session_token
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true

  has_many :cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cat

has_many :requests,
primary_key: :id,
foreign_key: :user_id,
class_name: 'CatRentalRequest'

  attr_reader :password

  COMMON_PASSWORDS = ['password']

  def self.find_by_credentials(uname, pword)
    @user = User.find_by(username: uname)
    @user && @user.is_password?(pword) ? @user : nil
  end

  def password=(psw)
    @password = psw
    self.password_digest = BCrypt::Password.create(psw)
  end

  def is_password?(psw)
    BCrypt::Password.new(self.password_digest).is_password?(psw)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end
end
