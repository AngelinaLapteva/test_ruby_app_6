class UsersV2 < ApplicationRecord
  # now whne creating user in console, you can call user.valid? and if it doesn't pass given validation it will return false
  # or if it false you can acess user.errors.full_messages, but messages only show up after running user.valid? or user.save
  validates :username, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }
end