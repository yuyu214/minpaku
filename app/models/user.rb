class User < ApplicationRecord
  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   
  has_many :reservations, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_rooms, through: :favorites, source: :room

         
   has_one_attached :avatar

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

has_many :reservations, dependent: :destroy 
has_many :facilities, dependent: :destroy
end
