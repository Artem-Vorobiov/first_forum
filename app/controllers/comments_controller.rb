class CommentsController < ApplicationController



  def create
    @post=Post.find(params[:post_id])
    @comment=@post.comments.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id if current_user

    if @comment.save
      redirect_to post_path(@post)
    else
    end
  end

  def edit
    @post=Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    @comment.user_id = current_user.id if current_user
  end

  def update
    @post=Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    @comment.user_id = current_user.id if current_user
    if @comment.update(params[:comment].permit(:comment))
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post=Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    @comment.user_id = current_user.id if current_user

    @comment.destroy
    redirect_to post_path(@post)
  end
end
