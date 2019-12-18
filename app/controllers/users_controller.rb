class UsersController < ApplicationController
    
    def new
        @user = User.new 
    end

    def create

        @user = User.create(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end

        def show
            @posts = current_user.posts
            @comments = current_user.comments
        end

    end

    def logout
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
    end

end
