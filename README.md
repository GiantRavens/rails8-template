# Rails 8 Template

A modern Rails 8 template with Tailwind CSS integration and component-based styling.

## Features

### Modern Layout
- Responsive design with 70% width content
- Dark sticky navigation bar
- Sticky footer with copyright
- Clean, modern aesthetics using Tailwind CSS

### DRY Tailwind Components
Custom Tailwind components are configured in `app/assets/tailwind/application.css` using `@layer components`. Example:

```css
@layer components {
  .hd1-hero {
    @apply text-4xl font-bold text-gray-900 mb-6 mt-8 leading-tight tracking-tight;
  }
}
```

### SEO Best Practices
- Dynamic page titles with consistent formatting
- SEO-optimized meta descriptions (160 characters)
- Open Graph meta tags for social sharing
- Semantic HTML structure
- Configurable application name via initializer

### Static Pages
- Configured with a static pages controller
- Includes Index, Welcome, and About pages
- Clean routes without prefixes (e.g., `/about` instead of `/pages/about`)

## Getting Started

1. Clone this repository
2. Run `bundle install`
3. Start the server with `rails server`

## Development

### Key Files
- Layout: `app/views/layouts/application.html.erb`
- Tailwind Components: `app/assets/tailwind/application.css`
- Routes: `config/routes.rb`
- Static Pages: `app/views/pages/*`
- App Configuration: `config/initializers/application_name.rb`

### Page Customization
Set page title and meta description in your views:
```erb
<% page_title "Your Page Title" %>
<% meta_description "Your SEO-friendly description (max 160 characters)" %>
```

## Technologies

- Ruby on Rails 8
- Tailwind CSS
- Propshaft asset pipeline
- SQLite3 database
