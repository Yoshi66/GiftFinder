class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  before_create :create_remember_token

  has_many :demands, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :medal, dependent: :destroy
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :user_type, presence: :true
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
