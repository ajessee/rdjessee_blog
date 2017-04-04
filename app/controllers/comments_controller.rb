class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  def new
    @comment = Comment.new
    find_commentable
  end

  def create
    find_commentable
    @comment = @commentable.comments.build(build_params)
    if @comment.save
      flash.now[:success] = "Comment created"
      redirect_to :back
    else
      render 'welcome/home'
    end
  end

  def index
    @pictures = Picture.all.order(created_at: :asc).paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update

  end


  def destroy
    @story.destroy
    flash[:success] = "Story deleted"
    redirect_to request.referrer || root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :picture_id, :comment_id, :story_id, :video_id)
  end

  def build_params
    params.require(:comment).permit(:content, :user_id)
  end

  def find_commentable
    @commentable = Picture.find_by_id(comment_params[:picture_id]) if comment_params[:picture_id]
    @commentable = Comment.find_by_id(comment_params[:comment_id]) if comment_params[:comment_id]
    @commentable = Story.find_by_id(comment_params[:story_id]) if comment_params[:story_id]
    @commentable = Video.find_by_id(comment_params[:video_id]) if comment_params[:video_id]
  end
end
