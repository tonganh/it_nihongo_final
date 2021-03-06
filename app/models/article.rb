class Article < ApplicationRecord
  # mot article chi thuoc ve mot user
  belongs_to :user
  has_one_attached :image

  has_many  :article_categories
  has_many  :categories, through: :article_categories
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end