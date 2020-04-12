# frozen_string_literal: true

class SearchController < ApplicationController
    
    def search
        @results = Story.search(search_params) unless search_params.blank?
    end

    private

    def search_params
        params.require(:query)
    end

end
