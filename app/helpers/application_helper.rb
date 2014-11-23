module ApplicationHelper

  def site_name
    # Change the value below between the quotes.
    "Progressor"
  end

  def site_url
    if Rails.env.production?
      # Place your production URL in the quotes below
      "http://progressorio.herokuapp.com/"
    else
      # Our dev & test URL
      "http://localhost:3000"
    end
  end

  def meta_author
    # Change the value below between the quotes.
    "Progressor Team"
  end

  def meta_description
    # Change the value below between the quotes.
    "Providing tools to increase productivity for an individual or a small to large size company."
  end

  def meta_keywords
    # Change the value below between the quotes.
    "productivity, individual, company, small, large, tools, providing, application, rails"
  end

  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def bootstrap_dropdown_button text, icon, links
    link_items = ""
    links.each do |l|
      link_items += "<li>#{l}</li>"
    end
    "
      <div class=\"btn-group\">
        <a class=\"btn dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">
          <i class=\"#{icon}\"></i> #{text}
          <span class=\"caret\"></span>
        </a>
        <ul class=\"dropdown-menu\">#{link_items}</ul>
      </div>
    ".html_safe
  end

  def ticket_status_label status
    label = case status
    when "Open"
      "success"
    when "Pending"
      "warning"
    when "Closed"
      "danger"
    end
  "<span class=\"btn btn-sm bg-#{label}\">#{status}</span>".html_safe
  end



end
