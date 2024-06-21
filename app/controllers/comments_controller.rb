# frozen_string_literal: true

class CommentsController < ApplicationController
  @comment = @commentable.comments.build(comment_params)
  @comment.user = current_user

  redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human) if @comment.save

  def set_commentable
    if params[:book_id]
      @commentable = Book.find(params[:book_id])
    elsif params[:report_id]
      @commentable = Report.find(params[:report_id])
    end
  end

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
