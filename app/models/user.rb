class User < ApplicationRecord
  # class name needed in order to access the table "articles_v2s" via its controller ArticlesV2s
  # so consol command would be user.articles_v2s
  validates :username, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  has_many :articles_v2s, class_name: 'ArticlesV2s'
end
