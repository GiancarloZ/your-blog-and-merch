class User < ActiveRecord::Base
    has_many :comments
    has_many :posts

    has_many :cart_items
    has_many :items, through: :cart_items
    
    has_secure_password
    validates :email, presence: true
    
end
