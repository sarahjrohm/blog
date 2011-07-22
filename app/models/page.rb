class Page < ActiveRecord::Base
  DEFAULT_LIMIT = 15

  acts_as_taggable

  before_validation       :generate_slug
  before_validation       :set_dates
  before_save             :apply_filter

  validates_presence_of   :title, :slug, :body

  validate                :validate_published_at_natural

  def validate_published_at_natural
    errors.add("published_at_natural", "Unable to parse time") unless published?
  end

  attr_accessor :minor_edit
  def minor_edit
    @minor_edit ||= "1"
  end

  def minor_edit?
    self.minor_edit == "1"
  end
  
  def get_image
    return image || "default.jpg"
  end

  def published?
    published_at?
  end

  attr_accessor :published_at_natural
  def published_at_natural
    @published_at_natural ||= published_at.send_with_default(:strftime, 'now', "%Y-%m-%d %H:%M")
  end

  class << self
    def build_for_preview(params)
      page = Page.new(params)
      page.apply_filter
      page
    end

    def find_all_grouped_by_month
      pages = find(
        :all,
        :order      => 'pages.published_at DESC',
        :conditions => ['published_at < ?', Time.now]
      )
      month = Struct.new(:date, :pages)
      pages.group_by(&:month).inject([]) {|a, v| a << month.new(v[0], v[1])}
    end
  end

  def set_dates
    self.published_at = Chronic.parse(self.published_at_natural)
  end

  def apply_filter
    self.body_html = EnkiFormatter.format_as_xhtml(self.body)
  end

  def active?
    true
  end

  def destroy_with_undo
    transaction do
      self.destroy
      return DeletePageUndo.create_undo(self)
    end
  end

  def generate_slug
    self.slug = self.title.dup if self.slug.blank?
    self.slug.slugorize!
  end
  
    def month
    published_at.beginning_of_month
    end
    
end
