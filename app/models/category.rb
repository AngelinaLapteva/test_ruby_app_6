class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  has_many :article_categories
  # through means that we are making many to many connection
  has_many :articles_v2s, class_name: 'ArticlesV2s', through: :article_categories
end 