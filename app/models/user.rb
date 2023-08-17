class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # has_secure_password
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります', if: :password_required? },
                       allow_blank: true

  has_many :events
  has_many :attendances
  has_many :comments
  has_one_attached :avatar

  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  mount_uploader :avatar, AvatarUploader

  def followed_by?(user)
    follower = passive_relationships.find_by(following_id: user.id)
    follower.present?
  end
end
