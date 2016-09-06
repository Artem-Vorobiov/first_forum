class CommentsController < ApplicationController



  def create
    @post=Post.find(permited_params[:post_id])
    @comment=@post.comments.create(permited_params[:comment])
    @comment.user = current_user if current_user

    if @comment.save!
      redirect_to post_path(@post)
    else
    end
  end

  def edit
    post
  end

  def update
    # post
    if comment.update(params[:comment].permit(:comment))
      redirect_to post_path(post)
    else
      render 'edit'
    end
  end

  def destroy
    comment.destroy
    redirect_to post_path(@post)
  end

  private
  def permited_params
    params.permit(:id, :post_id, :comment)
  end

  def comment
    @comment= Comment.find(permited_params[:id])
  end

  def post
    @post = comment.post
  end
end
