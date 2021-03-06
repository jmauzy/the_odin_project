class User < ActiveRecord::Base
	validates :username, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 50 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: {case_sensitive: false }
	has_secure_password
end
