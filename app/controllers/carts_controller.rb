class CartsController < ApplicationController
    
    def index
        @cart = Cart.find(session[:cart_id])
        @cart_items = @cart.cart_items 
        @cart_item_count = @cart_items.count unless @cart_items == nil
        # @items_quantity = @cart_items.collect{|item| @item_id = item.item_id, @item_quantity = item.item_quantity}
        # @items = @items_quantity.colect {|item| Item.find(item[0])}
        # # @name = @items.collect {|item| item.name}
        # # #@quantity = @items_quantity.collect {|quantity| quantity[1]}

        # @prices = @items.collect {|item| item.price}
        # @quantities =  @cart_items.collect{|item| item.item_quantity}
        # @totals = @prices * @quantities
        # @item = Item.find(@cart.items.item_id)
    end

    def show
        @cart = Cart.find(session[:cart_id])
    end

    def new
        @item = Item.find(params[:id])
        @cart = Cart.find(session[:cart_id])
    end
    
    def create
        @item = Item.find(params[:id])
        @cart = session[:cart] || []
        @cart << @item.id
 
        # Save the cart in the session.
        session[:cart] = cart
    end

    def edit
        @item = Item.find(params[:id])

    end

    def update
        @cart = Cart.find(session[:user_id])
        @cart.items.build(cart_params)
        if @cart.save
            redirect_to carts_path
        else
            render :edit
        end

    end

    private

    def cart_params
        params.require(:cart).permit(:user_id, item_id:[]) 
    end

end
