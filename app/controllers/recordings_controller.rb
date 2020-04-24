class RecordingsController < ApplicationController

  def new
    @recording = Recording.new
  end

  def index
  end

  def create
    @story = Story.find(story_params[:story_id])
    @recording = @story.recordings.build(recording_params)
    if @recording.save
      flash.now[:success] = "Recording uploaded successfully!"
      render js: %(window.location.href = "/stories/#{@story.id}")
    else
      render 'welcome/home'
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @recording = Recording.find(delete_params)
    @story = Story.find(@recording.recordable_id)
    @recording.destroy
    render 'stories/edit'
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

end
