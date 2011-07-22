class AlbumsController < ApplicationController
  
  def index
    @months = Page.find_all_grouped_by_month
  end
end