module MarkdownHelper
  require 'redcarpet'
  require 'sanitize'

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, {
      fenced_code_blocks: true,
      autolink: true,
      tables: true,
      strikethrough: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true
    })
    html = markdown.render(text.to_s)
    # Allow block tags for Markdown
    allowed_tags = Sanitize::Config::RELAXED[:elements] + %w[h1 h2 h3 h4 h5 h6 pre code]
    allowed_attributes = Sanitize::Config::RELAXED[:attributes].merge({
      'code' => ['class'],
      'pre' => ['class']
    })
    Sanitize.fragment(html, elements: allowed_tags, attributes: allowed_attributes).html_safe
  end
end
