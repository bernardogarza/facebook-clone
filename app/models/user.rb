class User < ApplicationRecord
  before_save   :downcase_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  private
    def downcase_email
      self.email = email.downcase
    end
end
