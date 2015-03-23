module ApplicationHelper
  def full_title(page_title)
    base_title = 'Shaun TM'
    if page_title.empty?
      base_title
    else
      [base_title, page_title].join( ' | ')
    end
  end
end
