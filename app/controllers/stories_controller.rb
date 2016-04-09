class StoriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  def new
  end

  def show
    @user = User.find(params[:id])
    @stories = @user.stories.paginate(page: params[:page])
  end

  def create
    @story = current_user.stories.build(story_params)
    if @story.save
      flash[:success] = "Story created!"
      render :show
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @story.destroy
    flash[:success] = "Story deleted"
    redirect_to request.referrer || root_url
  end

  private

    def story_params
      params.require(:story).permit(:title, :content, :year_written, :decade, :age, :recording?)
    end

     def correct_user
      @story = current_user.stories.find_by(id: params[:id])
      redirect_to root_url if @story.nil?
    end

end
