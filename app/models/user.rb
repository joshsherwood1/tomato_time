class User < ApplicationRecord
  validates_presence_of :username, :google_token, :email
end
