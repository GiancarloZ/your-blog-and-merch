class CartItemsController < ApplicationController
    
    def new
        @cart = Cart.find(session[:cart_id])
        @item = Item.find(params[:item_id])
        @cartitems = @item.cart_items.build #(item_id: @item.id, cart_id: @cart.id)
    end

    def create
        @item = Item.find(params[:item_id])
        @cart = Cart.find(session[:cart_id])
        @cartitems = @item.cart_items.create(item_id: @item.id, cart_id: @cart.id, item_quantity: params[:cart_item][:item_quantity])
        # @cartitems = current_cart.cart_items.build(cartitems_params)
        
        if @cartitems.save
             redirect_to carts_path
        else
             redirect_to new_item_cart_item_path
             flash[:alert] = "Could not add item"
        end

    end

    private

    def cartitems_params
        params.require(:cart_item).permit(:item_quantity, :item_id, :cart_id)
    end


end
