class CommentsController < ApplicationController
    
    def index

        if params[:post_id]
            @comments = Post.find(params[:post_id]).comments
        end

    end

    def new
        @comment = Comment.new(post_id: params[:post_id])
    end

    def create
        @comment = current_user.comments.build(comment_params) 
    
        if @comment.save
            redirect_to post_comments_path(@comment.post)
        else
            redirect_to post_path(@comment.post_id)
        end

    end

    def show
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end


    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        flash[:alert] = "Comment deleted."
        redirect_to post_path(@post)
    end
    
    private

    def comment_params
        params.require(:comment).permit(:user_comment, :user_id, :post_id)
    end

end
