class Cart < ActiveRecord::Base
    belongs_to :user 
    has_many :cart_items
    has_many :items, through: :cart_items
    has_many :orders 
    
    def cart_count
        if @cart = nil
            puts "0"
        else
            @cart
        end
    end

end
