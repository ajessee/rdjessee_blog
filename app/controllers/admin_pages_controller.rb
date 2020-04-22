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
    if params[:sort_info]
      query_string = "#{params[:sort_info][:sort_using]} #{params[:sort_info][:opposite_direction]}"
      @sortInfo = {"#{params[:sort_info][:sort_using]}": {direction: params[:sort_info][:opposite_direction], opposite_direction: params[:sort_info][:direction], icon_class: helpers.get_sort_icon_class(params[:sort_info][:sort_using], params[:sort_info][:opposite_direction])}}
    else
      query_string = "title ASC"
      @sortInfo = {"title": {direction: "ASC", opposite_direction: "DESC", icon_class: helpers.get_sort_icon_class("title", "ASC")}}
    end
    @stories = Story.all.order(query_string).paginate(page: params[:page])
  end

  private

    #before filters
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
