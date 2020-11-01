class ArticlesV2s < ApplicationRecord
  has_many :article_categories, class_name: 'ArticleCategory'
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: {minimum: 2, maximum: 100}
  validates :description, presence: true, length: {minimum: 4, maximum: 300}
  belongs_to :user
end