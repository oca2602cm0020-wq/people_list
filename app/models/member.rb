class Member < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :height, presence: { message: "Must be 1 height can't be blank" }
  validates :weight, presence: { message: "Must be 1 weight can't be blank" }
end