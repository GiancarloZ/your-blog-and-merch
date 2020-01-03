class PostsController < ApplicationController
    
    def index
        
        if params[:user_id]
            @posts = User.find(params[:user_id]).posts
        else
            @posts = Post.all
        end
        
        @most_comments = Post.post_comments.first
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

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:alert] = "Post deleted."
        redirect_to posts_path
    end


    private

    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end

end
