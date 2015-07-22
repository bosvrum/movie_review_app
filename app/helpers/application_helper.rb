module ApplicationHelper
  def page_title
    if content_for?(:title)
      "MovieReviewApp- #{content_for(:title)}"
    else
      "MovieReviewApp"
    end
  end
end
