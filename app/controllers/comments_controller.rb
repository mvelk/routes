class CommentsController < ApplicationController
  def index
    if params.has_key?(:contact_id)
      @comments = Comment.where(contact_id: params[:contact_id])
    elsif params.has_key?(:user_id)
      @comments = Comment.where(user_id: params[:user_id])
    elsif params.has_key?(:contact_share_id)
      @comments = Comment.where(contact_share_id: params[:contact_share_id])
    else
      @comments = Comment.all
    end
    render json: @comments
  end

  # app/controller/users_controller.rb
  def create
    # debugger
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    comment = Comment.find_by(params[:id])
    render json: comment
  end

  def destroy
    comment = Comment.find_by(params[:id])
    comment.destroy!
    render text: 'Comment Destroyed'
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :body, :user_id, :contact_id, :contact_share_id)
  end
end
