class User < ApplicationRecord
  # class name needed in order to access the table "articles_v2s" via its controller ArticlesV2s
  # so consol command would be user.articles_v2s
  has_many :articles_v2s, class_name: 'ArticlesV2s'
end