# app/models/facility.rb
class Facility < ApplicationRecord
  belongs_to :user
 has_many :rooms, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  has_one_attached :image
 belongs_to :user
end
