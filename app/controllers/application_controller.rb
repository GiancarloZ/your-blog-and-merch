class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :current_cart, :cart_item_count
  
    def logged_in?
      !!current_user
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def current_cart
      session[:cart] ||= Cart.find_by(id: session[:cart_id])
    end

    def cart_item_count
      @cart = Cart.find(session[:cart_id])
      @cart_items = @cart.cart_items 
      @cart_items.count
      if @cart_items.count == nil
        "0"
      else
        @cart_items.count
      end
    end

end
