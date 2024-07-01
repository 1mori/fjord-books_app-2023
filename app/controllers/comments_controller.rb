# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def edit; end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render @commentable, alert: t('errors.messages.failed_to_create', name: Comment.model_name.human)
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy!

    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user!
    redirect_to @commentable, alert: t('errors.messages.not_authorized') if @comment.user_id != current_user.id
  end
end
