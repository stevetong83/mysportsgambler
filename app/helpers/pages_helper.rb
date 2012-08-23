module PagesHelper

  def page_title
    default = "My Sports Gambler"
    if @page_title.nil?
      default
    else
      @page_title
    end
  end

  def meta_keywords
    "sports betting information, expert sports handicapping, winning sports betting picks. "
  end

  def meta_description
    "sports betting information, expert sports handicapping, and winning sports betting picks. "
  end

end
