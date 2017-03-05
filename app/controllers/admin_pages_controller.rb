class AdminPagesController < ApplicationController

  def main
    @user = current_user
  end

  def admin_users
    @users = User.all.order(:id).paginate(page: params[:page])
  end

  def admin_stories
    @stories = Story.all.order(:id).paginate(page: params[:page])
  end

end
