class User < ApplicationRecord
  # mthis method is doing something before saving data into table, self is referencing each object which comes to this class
  before_save { self.email = email.downcase }
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
  
  #  we need  dependent: destroy because if we delete user we want to delete all realted to this user articles 
  has_many :articles_v2s, class_name: 'ArticlesV2s', dependent: :destroy
  # adding passwords to uses, after that in terminal i can assigned user.password = "something" and it will hash and put it into "password_digest"
  has_secure_password
end
