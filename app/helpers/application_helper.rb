module ApplicationHelper
  def link_unless_person_is_away(link)
    if link.is_away?
      "#{link.person.name} is away"
    else
      link_to link.title, link.url
    end
  end

  def icon_credit(link)
    if link.is_away?
      "Suitcase by Diego Naive from the Noun Project"
    else
      link.icon_attribution
    end
  end

  def icon_link_unless_away(link)
    if link.is_away?
      image_tag 'suitcase.png', width: 100
    else
      link_to image_tag(link.icon(:thumb), width: 100), link.url
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
    if previous = theme.previous
      link_to "← #{previous.title}", theme_path(previous)
    end
  end

  def next_theme(theme)
    if forward = theme.next
      link_to "#{forward.title} →", theme_path(forward)
    end
  end
end

