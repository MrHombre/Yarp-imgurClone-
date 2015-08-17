class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      flash[:sucess] = 'Comment Posted'
      redirect_to post_path(@post)
    else
      flash[:error] = 'Something went wrong'
      redirect_to post_path(@post)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
