class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :user_image

  has_many :books
  validates :name,
    presence: true,
    length: { minimum: 2, maximum: 20 }
  # validates :email,
  #   presence: true
  # validates :password,
  #   presence: true
  validates :introduction,
    length: { maximum: 50 }

end
