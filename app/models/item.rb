class Item < ActiveRecord::Base
    has_many :cart_items
    has_many :carts, through: :cart_items
    validates :name, :price, presence: true
end
