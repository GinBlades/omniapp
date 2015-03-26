module ApplicationHelper
  def full_title(page_title)
    base_title = 'Shaun TM'
    if page_title.empty?
      base_title
    else
      [base_title, page_title].join( ' | ')
    end
  end

  def date_form(time)
    time.try(:strftime, '%Y-%m-%d')
  end

  def time_form(time)
    time.try(:strftime, '%Y-%m-%dT%H:%M:00')
  end

  def add_icon
    content_tag :span, '', class: 'glyphicon glyphicon-plus-sign'
  end

  def remove_icon
    content_tag :span, '', class: 'glyphicon glyphicon-remove-sign'
  end
end
