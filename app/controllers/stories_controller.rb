class StoriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  def new
  end

  def index
    @stories = Story.all.order(title: :asc).paginate(:page => params[:page], :per_page => 3)
    @active_button = "alphabetical"
    age_array = []
    year_array = []
    decade_array = []
    Story.find_each do |story|
      age_array.push(story.age)
      year_array.push(story.year_written)
      decade_array.push(story.decade)
    end
    @ages = age_array.sort.uniq!
    @years = year_array.sort.uniq!
    @decades = decade_array.sort.uniq!
  end

  def sort
    age_array = []
    year_array = []
    decade_array = []
    Story.find_each do |story|
      age_array.push(story.age)
      year_array.push(story.year_written)
      decade_array.push(story.decade)
    end
    @ages = age_array.sort.uniq!
    @years = year_array.sort.uniq!
    @decades = decade_array.sort.uniq!
    case params[:sort]
    when "year_written"
      @active_button = "year"
      @stories = Story.where(year_written: params[:year].to_i).paginate(:page => params[:page], :per_page => 3)
      render 'index'
    when "decade"
      @active_button = "decade"
      @stories = Story.where(decade: params[:decade].to_i).paginate(:page => params[:page], :per_page => 3)
      render 'index'
    when "age"
      @active_button = "age"
      @stories = Story.where(age: params[:age].to_i).paginate(:page => params[:page], :per_page => 3)
      render 'index'
    end
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
