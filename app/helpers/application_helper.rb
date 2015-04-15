module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Framgia Books Review System"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end 

  def domain
    domain = "http://localhost:3000"
  end 
end
