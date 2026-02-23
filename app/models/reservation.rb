# app/models/reservation.rb
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, :check_out, :people, presence: true
  validates :people, numericality: { greater_than_or_equal_to: 1 }
  validate :check_in_after_today
  validate :check_out_after_check_in

  def stay_days
  return 0 if check_in.blank? || check_out.blank?
  (check_out - check_in).to_i
end

  def total_price
    stay_days * people * room.price
  end

  private

  def check_in_after_today
    return if check_in.blank?
    errors.add(:check_in, "は本日以降にしてください") if check_in < Date.today
  end

  def check_out_after_check_in
    return if check_in.blank? || check_out.blank?
    errors.add(:check_out, "はチェックイン後にしてください") if check_out <= check_in
  end
end
