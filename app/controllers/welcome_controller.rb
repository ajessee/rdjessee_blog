class WelcomeController < ApplicationController

  def welcome
    @stories = Story.order("RANDOM()").limit(3)
    @pictures = Picture.order("RANDOM()").limit(3)
    @videos = Video.order("RANDOM()").limit(3)
    @guestbook_comments = Comment.where(commentable_type: "User")
  end

  def about
  end

end
