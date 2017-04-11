class RecordingsController < ApplicationController

  def new
    @recording = Recording.new
  end

  def index
  end

  def create
    @story = Story.find(story_params[:story_id])
    @recording = @story.recordings.build(user_id: params[:recording][:user_id], recording: params[:recording][:recording])
    if @recording.save
      flash.now[:success] = "Recording uploaded successfully!"
      render :show
    else
      render 'welcome/home'
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def recording_params
    params.require(:recording).permit(:id, :recording, :user_id)
  end

  def story_params
    params.require(:recording).permit(:story_id)
  end

end
