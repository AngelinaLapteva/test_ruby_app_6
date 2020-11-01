class ArticleCategory < ApplicationRecord
  # means this table ArticleCategory belongs to both tables
  belongs_to :articles_v2s
  belongs_to :category
end 