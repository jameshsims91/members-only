class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }
end
