class RecordingsController < ApplicationController

  def new
    @recording = Recording.new
  end

  def index
    @stories_with_recordings = Story.joins(:recordings).order(title: :asc).paginate(:page => params[:story_recordings], :per_page => 4)
    @user_recordings = Recording.where(recordable_type: "User").paginate(:page => params[:user_recordings], :per_page => 6)
  end

  def create
    if (story_params[:story_id])
      @story = Story.find(story_params[:story_id])
      @recording = @story.recordings.build(recording_params)
      if @recording.save
        flash.now[:success] = "Recording uploaded successfully!"
        render js: %(window.location.href = "/stories/#{@story.id}")
      else
        render 'welcome/home'
      end
    else
      @user = User.find(user_params[:user_id])
      @recording = @user.recordings.build(recording_params)
      if @recording.save
        flash.now[:success] = "Recording uploaded successfully!"
        redirect_to recordings_path 
      else
        render 'welcome/home'
      end
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @recording = Recording.find(delete_params)
    if @recording.recordable_type == "Story"
      @story = Story.find(@recording.recordable_id)
      @recording.destroy
      render 'stories/edit'
    elsif @recording.recordable_type == "User"
      @recording.destroy
      flash[:success] = "Recording deleted successfully!"
      redirect_to recordings_path
    end

  end

  def update
  end

  private

  def delete_params
    params.require(:id)
  end

  def recording_params
    params.require(:recording).permit(:caption, :audio_file)
  end

  def story_params
    params.require(:recording).permit(:story_id)
  end

  def user_params
    params.require(:recording).permit(:user_id)
  end

end
