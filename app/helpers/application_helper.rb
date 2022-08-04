module ApplicationHelper
  # BASE_TITLE = "Store".freeze
  def full_title(page_title)
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title}"
    end
  end
end
