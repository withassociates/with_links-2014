module ApplicationHelper
  def link_unless_person_is_away(link)
    if link.is_away?
      "is Away"
    else
      link_to link.title, link.url
    end
  end

  def icon_or_away_icon(link)
    if link.is_away?
      'suitcase.png'
    else
      link.icon(:thumb)
    end
  end

  def icon_credit(link)
    if link.is_away?
      "Suitcase by Diego Naive from the Noun Project"
    else
      link.icon_attribution
    end
  end

  def person_or_theme(link)
    if controller_name == 'people'
      link.theme.title
    else
      link.person.name
    end
  end
end

