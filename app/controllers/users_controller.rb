class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page]).per(1)
  end

  def show; end

  def edit; end
end
