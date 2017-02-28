class StoriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  def new
  end

  def show
    # debugger
    @story = Story.find(params[:id])
    # @user = User.find(params[:id])
    # @stories = @user.stories.paginate(page: params[:page])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(story_params)
      flash[:success] = "Story updated"
      redirect_to @story
    else
      render 'edit'
    end 
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
      params.require(:story).permit(:title, :content, :year_written, :decade, :age, :recording?, :thumbnail, :category)
    end

     def correct_user
      @story = current_user.stories.find_by(id: params[:id])
      redirect_to root_url if @story.nil?
    end

end
