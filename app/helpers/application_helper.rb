module ApplicationHelper
  def display_title page_title=""
  	base_title = "Ruby on Rails Chapter 3"
    page_title = (page_title.empty? ? page_title : page_title + " | ") + base_title
  end
end
