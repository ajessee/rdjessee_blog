class TagsController < ApplicationController

  def show

  end

  def index
    @tags = Tag.all
  end
    
end
