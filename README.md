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

### Static Pages
- Configured with a static pages controller
- Includes Index, Welcome, and About pages
- Clean routes without prefixes (e.g., `/about` instead of `/pages/about`)

## Getting Started

1. Clone this repository
2. Run `bundle install`
3. Start the server with `bin/dev` (includes live reload)

## Development

### Key Files
- Layout: `app/views/layouts/application.html.erb`
- Tailwind Components: `app/assets/tailwind/application.css`
- Routes: `config/routes.rb`
- Static Pages: `app/views/pages/*`

### Live Reload
Development server includes live reload functionality using:
- hotwire-livereload gem
- browser-sync integration

## Technologies

- Ruby on Rails 8
- Tailwind CSS
- Hotwire
- Propshaft asset pipeline
- SQLite3 database
