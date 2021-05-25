class User < ApplicationRecord
    has_many :memberships
    has_many :chatrooms, through: :memberships
    has_many :messages
    
    validates :username, uniqueness: true
    has_secure_password
end
