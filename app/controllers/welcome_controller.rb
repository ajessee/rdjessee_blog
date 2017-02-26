class WelcomeController < ApplicationController

  def welcome
    @stories = Story.all
  end

  def about
  end

end
