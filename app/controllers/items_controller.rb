class ItemsController < ApplicationController 
    def index
        @items = Item.all
        @cart = Cart.find(session[:cart_id])
    end

    def show
        @item = Item.find(params[:id])
        @cart = Cart.find(session[:cart_id])
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)

        if @item.save
            redirect_to item_path(@item)
        else
            render :new
        end
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])

        @item.update(item_params)
    
        if @item.save
          redirect_to item_path(@item)
        else
          render :edit
        end
    end

    private

    def item_params
        params.require(:item).permit(:name, :price)
    end

end
