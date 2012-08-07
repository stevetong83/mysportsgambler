module PagesHelper

  def page_title
    default = "My Sports Gambler"
    if @page_title.nil?
      default
    else
      @page_title
    end
  end

end
