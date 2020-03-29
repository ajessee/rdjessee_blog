class VideosController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :edit]

  def new
    @video = current_user.videos.new
  end

  def create
   @video = current_user.videos.build(video_params)
   if @video.save
     flash.now[:success] = "video uploaded successfully!"
     render :show
   else
     render 'new'
   end
  end

 def index
   @videos = Video.all.order(created_at: :asc).paginate(:page => params[:page], :per_page => 6)
 end

 def show
   @video = Video.find(params[:id])
 end

 def edit
   @video = Video.find(params[:id])
 end

 def update

 end


 def destroy
   @video.destroy
   flash[:success] = "Story deleted"
   redirect_to request.referrer || root_url
 end

 private

 def video_params
   params.require(:video).permit(:caption, :year, :video, :video_file, :user_id)
 end

end
