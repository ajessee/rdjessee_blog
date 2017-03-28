class RecordingsController < ApplicationController

  def new
    @recording = Recording.new
  end

  def index
  end

  def create
    @recording = current_user.recordings.build(recording_params)
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
    params.require(:recording).permit(:recording, :user_id)
  end

end
