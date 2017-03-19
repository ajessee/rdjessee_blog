class PicturesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :new, :edit]
    before_action :correct_user,   only: [:destroy, :edit]

    def new
      @picture = current_user.pictures.new
    end

    def create
      @picture = current_user.pictures.build(picture_params)
      @picture.strip_divs
      if @picture.save
        flash.now[:success] = "Picture uploaded successfully!"
        render :show
      else
        render 'welcome/home'
      end
    end


    def index

    end

    def show
      @story = Story.find(params[:id])
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

    def picture_params
      params.require(:picture).permit(:caption, :url)
    end

    def correct_user
      @story = current_user.stories.find_by(id: params[:id])
      redirect_to root_url if @story.nil?
    end

end
