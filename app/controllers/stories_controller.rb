class StoriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :edit]
  before_action :admin_user,   only: [:destroy, :edit]

  def new
    @story = Story.new
  end

  def index
    @stories = Story.get_stories(params[:page])
    @active_button = "alphabetical"
    Story.get_metadata
    @years = Story.all_years
    @decades = Story.all_decades
    @locations = Story.all_locations
    @genres = Story.all_genres
    @categories = Story.all_categories
    @life_stages = Story.all_life_stages
  end

  def sort
    Story.get_metadata
    @years = Story.all_years
    @decades = Story.all_decades
    @locations = Story.all_locations
    @genres = Story.all_genres
    @categories = Story.all_categories
    @life_stages = Story.all_life_stages
    case params[:sort]
    when "year_written"
      @active_button = "year"
      @stories = Story.order_by_year(params[:year], params[:page])
      render 'index'
    when "decade"
      @active_button = "decade"
      @stories = Story.order_by_decade(params[:decade], params[:page])
      render 'index'
    when "location"
      @active_button = "location"
      @stories = Story.order_by_location(params[:location] , params[:page])
      render 'index'
    when "genre"
      @active_button = "genre"
      @stories = Story.order_by_genre(params[:genre] , params[:page])
      render 'index'
    when "category"
      @active_button = "category"
      @stories = Story.order_by_category(params[:category] , params[:page])
      render 'index'
    when "life_stage"
      @active_button = "life_stage"
      @stories = Story.order_by_life_stage(params[:life_stage] , params[:page])
      render 'index'
    when "tag"
      @active_button = "tag"
      @stories = Story.order_by_tag(params[:tag] , params[:page])
      render 'index'
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    if request.xhr?
      @story = Story.find(params[:id])
      params[:attributeValue] = nil if params[:attributeValue] == ""
      if @story[params[:attributeToUpdate]].to_s != params[:attributeValue]
        if @story.update_attributes(params[:attributeToUpdate] => params[:attributeValue])
          @story.strip_divs
          @story.get_wordcount
          @story.save
          @value = @story[params[:attributeToUpdate]]
          render plain: "Change"
        end
      end
    else
      @story = Story.find(params[:id])
      clean_story_params
      if @story.update_attributes(story_params)
        @story.strip_divs
        @story.get_wordcount
        @story.save
        flash[:success] = "Story updated"
        redirect_to @story
      else
        render 'edit'
      end 
    end

  end

  def create
    clean_story_params
    @story = current_user.stories.build(story_params)
    @story.strip_divs
    @story.get_wordcount
    if @story.save
      flash.now[:success] = "Story created!"
      render :show
    else
      render 'welcome/home'
    end
  end

  def destroy
    @story.destroy
    flash.now[:success] = "Story deleted"
    redirect_to request.referrer || root_url
  end

  private

  def story_params
    params.require(:story).permit(:title, :content, :year_written, :decade, :location, :genre, :category, :life_stage, :thumbnail, :all_tags, recordings_attributes: [:caption, :recording])
  end

  def video_params
    params.require(:story).permit(videos_attributes: ["video", "@original_filename", "@content_type", "@headers", "_destroy", "id"])
  end

  def recording_params
    params.require(:story).permit(recordings_attributes: [:caption, :recording])
  end

  def clean_story_params
    if story_params[:year_written] == "None"
      params[:story][:year_written] = nil
    end
    if story_params[:decade] == "None"
      params[:story][:decade] = nil
    end
    if story_params[:genre] == ""
      params[:story][:genre] = nil
    end
    if story_params[:location] == ""
      params[:story][:location] = nil
    end
    if story_params[:category] == ""
      params[:story][:category] = nil
    end
    if story_params[:life_stage] == ""
      params[:story][:life_stage] = nil
    end
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def correct_user
    @story = current_user.stories.find_by(id: params[:id])
    redirect_to root_url if @story.nil?
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

  def sort_location
    location_array = []
    Story.find_each do |story|
      location_array.push(story.location)
    end
    @locations = location_array.sort.uniq!
  end

  def sort_genre
    genre_array = []
    Story.find_each do |story|
      genre_array.push(story.genre)
    end
    @genres = genre_array.sort.uniq!
  end

  def sort_type
    type_array = []
    Story.find_each do |story|
      type_array.push(story.type)
    end
    @types = type_array.sort.uniq!
  end

  def sort_life_stage
    life_stage_array = []
    Story.find_each do |story|
      life_stage_array.push(story.life_stage)
    end
    @life_stages = life_stage_array.sort.uniq!
  end


end
