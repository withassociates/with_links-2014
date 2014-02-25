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
      link_to link.theme.title, theme_path(link.theme)
    else
      link_to link.person.name, person_path(link.person)
    end
  end

  def previous_theme(theme)
    prev = Theme.published.find(theme.id - 1)
    link_to "← #{prev.title}", theme_path(prev) unless prev.nil?
  rescue ActiveRecord::RecordNotFound => e
    prev = nil
  end

  def next_theme(theme)
    forward = Theme.published.find(theme.id + 1)
    link_to "#{forward.title} →", theme_path(forward) unless forward.nil?
  rescue ActiveRecord::RecordNotFound => e
    forward = nil
  end
end

