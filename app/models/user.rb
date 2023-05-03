class User < ApplicationRecord
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :name, :age, :email, presence: true
  validates :age, numericality: true
  validates :email, uniqueness: true
  validate :valid_avatar

  private

  def valid_avatar
    return unless avatar.attached?
    valid_types = ["image/jpeg", "image/png"]
    unless valid_types.include? avatar.content_type
      errors.add(:avatar, "not a valid image")
    end
  end
end