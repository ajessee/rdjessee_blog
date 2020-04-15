class TagsController < ApplicationController

  def show
    render layout: false
  end

  def index
    sort_id = params[:sort_id]
    if sort_id
      sql_query = "LOWER(name) " + /-\s*\K[^-]+$/.match(sort_id)[0].upcase
      @tags = Tag.all.order(sql_query)
    else
      sort_id = 'sort-tags-asc'
      @tags = Tag.all.order("LOWER(name) ASC")
    end
    render layout: false, locals: {order: sort_id}
  end
    
end
