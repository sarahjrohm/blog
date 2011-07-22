module NavigationHelper
  
  def page_links_for_navigation
    link = Struct.new(:name, :url)
    [link.new("Home", root_path),
    # link.new("Pictures", pictures_path),
     link.new("Trip Map", map_path),
     link.new("About", about_path),
     link.new("Contact", contact_path),
     link.new("Archives", archives_path)] 
  end

  def category_links_for_navigation
    link = Struct.new(:name, :url)
    @popular_tags ||= Tag.find(:all).reject {|tag| tag.taggings.empty? }.sort_by {|tag| tag.taggings.size }.reverse
    @popular_tags.collect {|tag| link.new(tag.name, posts_path(:tag => tag.name)) }
  end
  
    def picture_links_for_navigation
    link = Struct.new(:name, :url)
    Page.find(:all, :order => 'title').collect {|page| link.new(page.title, page_path(page.slug))}
  end

  def class_for_tab(tab_name, index)
    classes = []
    classes << 'current' if "admin/#{tab_name.downcase}" == params[:controller]
    classes << 'first'   if index == 0
    classes.join(' ')
  end
end
