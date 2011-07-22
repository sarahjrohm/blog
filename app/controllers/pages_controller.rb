class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:id]) || raise(ActiveRecord::RecordNotFound)
      
  end
  
  def index
    @months = Page.find_all_grouped_by_month
  end

end
