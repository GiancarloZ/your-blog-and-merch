class SessionsController < ApplicationController
    def new
    end
    
    def create
      user = User.find_by(email: params[:user][:email]) || User.find_by(email: data['email'])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        @cart = Cart.find_or_create_by(user_id: session[:user_id])
        session[:cart_id] = @cart.id
        redirect_to posts_path
      else
        flash[:alert] = "Email or Password is incorrect!"
        redirect_to "/"
      end
    end
    
end
