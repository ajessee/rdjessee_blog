class WelcomeController < ApplicationController

  def welcome
    @stories = Story.order("RANDOM()").limit(3)
    @pictures = Picture.order("RANDOM()").limit(3)
    @videos = Video.order("RANDOM()").limit(3)
    @story_recordings = Recording.where(recordable_type: "Story").order("RANDOM()").limit(3)
    @user_recordings = Recording.where(recordable_type: "User").order("RANDOM()").limit(5)
    @guestbook_comments = Comment.where(commentable_type: "User")
  end

  def about
  end

end
