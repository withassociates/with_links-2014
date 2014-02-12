module ApplicationHelper
  def link_unless_person_is_away(link)
    if link.is_away?
      "is Away"
    else
      link_to link.title, link.url
    end
  end
end
