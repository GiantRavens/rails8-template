module ApplicationHelper
  # Returns the application name from configuration
  # Usage: <%= app_name %> in views
  def app_name
    Rails.application.config.app_name
  end

  # Returns formatted page title
  # Usage: <% page_title "About" %> in views
  def page_title(title = nil)
    base_title = app_name
    if title.present?
      content_for(:title) { "#{title} | #{base_title}" }
    else
      content_for?(:title) ? content_for(:title) : base_title
    end
  end

  # Sets and returns meta description
  # Usage: <% meta_description "Your description here" %>
  def meta_description(description = nil)
    if description.present?
      content_for(:meta_description) { truncate(description, length: 160) }
    else
      content_for?(:meta_description) ? content_for(:meta_description) : app_name
    end
  end

  # Returns Open Graph meta tags
  # Usage: <%= og_meta_tags %> in layout
  def og_meta_tags
    tags = []
    tags << tag(:meta, property: "og:title", content: page_title)
    tags << tag(:meta, property: "og:description", content: meta_description)
    tags << tag(:meta, property: "og:type", content: "website")
    # Add more Open Graph tags as needed
    tags.join("\n").html_safe
  end
end
