module PageTitleHelper
  def posts_title(tag)
    compose_title((tag || "").to_s.titleize)
  end

  def post_title(post)
    compose_title(post.title)
  end

  def archives_title
    compose_title("Archives")
  end
  
  def albums_title
    compose_title("Pictures")
  end
  
  def about_title
    compose_title("About")
  end
  
  def contact_title
    compose_title("Contact")
  end
  
    def map_title
    compose_title("Trip Map")
  end

  def page_title(page)
    compose_title(page.title)
  end

  def html_title(content)
    if content.present?
      content
    else
      enki_config[:title]
    end
  end

  private

  def compose_title(*parts)
    (parts << enki_config[:title]).reject(&:blank?).join(" - ")
  end
end
