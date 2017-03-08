class AdminPagesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def main
    @user = current_user
  end

  def admin_users
    @users = User.all.order(:id).paginate(page: params[:page])
  end

  def admin_stories
    @stories = Story.all.order(:id).paginate(page: params[:page])
  end

  private

    #before filters
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
