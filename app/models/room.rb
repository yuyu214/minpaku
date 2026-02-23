# app/models/room.rb
class Room < ApplicationRecord
  belongs_to :user
 belongs_to :facility
  has_many :reservations, dependent: :destroy
  has_one_attached :image

has_many :favorites, dependent: :destroy
has_many :favorited_users, through: :favorites, source: :user


end
