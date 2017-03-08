class StoriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  def new
    @story = Story.new
  end

  def index
    @stories = Story.three_random_stories(params[:page])
    @active_button = "alphabetical"
    Story.get_metadata
    @ages = Story.all_ages
    @years = Story.all_years
    @decades = Story.all_decades
  end

  def sort
    Story.get_metadata
    @ages = Story.all_ages
    @years = Story.all_years
    @decades = Story.all_decades
    case params[:sort]
    when "year_written"
      @active_button = "year"
      @stories = Story.order_by_year(params[:year], params[:page])
      render 'index'
    when "decade"
      @active_button = "decade"
      @stories = Story.order_by_decade(params[:decade], params[:page])
      render 'index'
    when "age"
      @active_button = "age"
      @stories = Story.order_by_age(params[:age] , params[:page])
      render 'index'
    end
  end

  def show
    @story = Story.find(params[:id])
    # @user = User.find(params[:id])
    # @stories = @user.stories.paginate(page: params[:page])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update

    if request.xhr?
      @story = Story.find(params[:id])
      if @story[params[:attributeToUpdate]].to_s != params[:attributeValue]
        if @story.update_attributes(params[:attributeToUpdate] => params[:attributeValue])
          flash[:success] = "Story updated"
          @value = @story[params[:attributeToUpdate]]
          render plain: "Change"
        end
      end
    else
      @story = Story.find(params[:id])
      if @story.update_attributes(story_params)
        flash[:success] = "Story updated"
        redirect_to @story
      else
        render 'edit'
      end 

    end

  end

  def create
    @story = current_user.stories.build(story_params)
    if @story.save
      flash[:success] = "Story created!"
      render :show
    else
      render 'welcome/home'
    end
  end

  def destroy
    @story.destroy
    flash[:success] = "Story deleted"
    redirect_to request.referrer || root_url
  end

  private

    def story_params
      params.require(:story).permit(:title, :content, :year_written, :decade, :age, :thumbnail)
    end

     def correct_user
      @story = current_user.stories.find_by(id: params[:id])
      redirect_to root_url if @story.nil?
    end

    def sort_age
      age_array = []
      Story.find_each do |story|
        age_array.push(story.age)
      end
      @ages = age_array.sort.uniq!
    end

    def sort_year
      year_array = []
      Story.find_each do |story|
        year_array.push(story.year_written)
      end
      @years = year_array.sort.uniq!
    end

    def sort_decade
      decade_array = []
      Story.find_each do |story|
        decade_array.push(story.decade)
      end
      @decades = decade_array.sort.uniq!
    end

end
