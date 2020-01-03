class OrdersController < ApplicationController 
    def index
        @orders = Order.all
    end

    def show
        @cart = Cart.find(params[:cart_id])
        @order = Order.find(params[:id])

        @cart_items = @cart.cart_items
        @totals = []

        @cart_items.map do |item|
            
            @name = Item.find(item.item_id).name
            @price = Item.find(item.item_id).price
            @quantity = item.item_quantity
            @total = @price * @quantity
            @totals << @total
            
        end

        @order_items = @order.cart.cart_items
        
    end
    
    private

    def order_params
        params.require(:cart).permit(:cart_id, item_id:[]) 
    end

end
