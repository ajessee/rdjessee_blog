class WelcomeController < ApplicationController

  def welcome
    @stories = Story.order("RANDOM()").limit(3)
    @pictures = Picture.order("RANDOM()").limit(3)
  end

  def about
  end

end
