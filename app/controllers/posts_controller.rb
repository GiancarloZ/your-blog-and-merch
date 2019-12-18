class PostsController < ApplicationController
    
    def index
        
        if params[:user_id]
            @posts = User.find(params[:user_id]).posts
        else
            @posts = Post.all
        end

    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        @post.user_id = session[:user_id]

        if @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post =   Post.find(params[:id])  
    end

    def update
        @post = Post.find(params[:id])

        @post.update(post_params)
    
        if @post.save
          redirect_to post_path(@post)
        else
          render :edit
        end
    end



    private

    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end

end
