class User < ApplicationRecord
  validates :name, :age, :email, presence: true
  validates :age, numericality: true
  validates :email, uniqueness: true

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :avatar, file_content_type: { allow: ["image/png", "image/jpg"] }
end