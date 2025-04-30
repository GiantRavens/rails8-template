# Rails 8 Template

A modern Rails 8 template with Tailwind CSS integration, component-based styling, authentication, and admin interface.

## Features

### Modern Layout
- Responsive design with 70% width content
- Dark sticky navigation bar
- Sticky footer with copyright
- Clean, modern aesthetics using Tailwind CSS

### Authentication System
- Complete Devise integration with customized views
- User registration with extended profile fields (first_name, last_name, preferred_name, bio)
- Email confirmation workflow
- Password reset functionality
- Remember me option
- Secure authentication with UUID v7 for User IDs

### Admin Interface
- Custom admin dashboard with user and post statistics
- User management (create, edit, delete)
- Post management (create, edit, delete)
- Admin-only access with is_admin flag
- Consistent navigation between admin sections

### DRY Tailwind Components
Custom Tailwind components are configured in `app/assets/tailwind/application.css` using `@layer components`. Example:

```css
@layer components {
  .hd1-hero {
    @apply text-4xl font-bold text-gray-900 mb-6 mt-8 leading-tight tracking-tight;
  }
  
  .action-bar { 
    @apply w-full flex justify-center items-center mt-3 py-3 space-x-3; 
  }
  
  .action-link { 
    @apply text-sm font-medium text-gray-900 hover:text-blue-600 transition text-center px-2.5 py-1.5 inline-block;
  }
}
```

### Consistent UI Patterns
- Hierarchical heading system (hd1-hero, hd2, hd2-card, hd3)
- Form styling with clear visual hierarchy
- Action bars for consistent navigation
- Standardized button styles and colors

### SEO Best Practices
- Dynamic page titles with consistent formatting
- SEO-optimized meta descriptions (160 characters)
- Open Graph meta tags for social sharing
- Semantic HTML structure
- Configurable application name via initializer

### Content Management
- Blog post creation with Markdown support
- SimpleMDE Markdown editor integration
- Draft/published status for posts
- User-associated content

### Static Pages
- Configured with a static pages controller
- Includes Index, Welcome, About, and Dashboard pages
- Clean routes without prefixes (e.g., `/about` instead of `/pages/about`)

## Getting Started

### Development

1. Clone this repository
2. Run `bundle install`
3. Set up the database:
   ```bash
   rails db:create db:migrate
   ```
4. Create an admin user (optional):
   ```bash
   rails admin:create[your@email.com]
   ```
5. Start the development server:
   ```bash
   bin/dev
   ```
6. Visit http://localhost:3000

### Production-like Environment (Docker)

Test the production build locally using Docker:

1. Make sure Docker is running
2. Build and start the container:
   ```bash
   docker-compose up --build
   ```
3. Visit http://localhost (note: no port needed)
4. To stop the container:
   ```bash
   docker-compose down
   ```

#### Development vs Production Differences
- Development serves uncompressed assets individually
- Production concatenates and minifies all assets
- Development includes detailed error pages and debugging tools
- Production uses streamlined error pages

## Development

### Key Files
- Layout: `app/views/layouts/application.html.erb`
- Tailwind Components: `app/assets/tailwind/application.css`
- Routes: `config/routes.rb`
- Static Pages: `app/views/pages/*`
- Authentication: `app/controllers/users/*` and `app/views/devise/*`
- Admin Interface: `app/controllers/admin/*` and `app/views/admin/*`
- App Configuration: `config/initializers/application_config.rb`
- Docker Configuration: `docker-compose.yml` and `Dockerfile`

### Page Customization
Set page title and meta description in your views:
```erb
<% page_title "Your Page Title" %>
<% meta_description "Your SEO-friendly description (max 160 characters)" %>
```

## Technologies

- Ruby on Rails 8
- Tailwind CSS
- Devise for authentication
- SimpleMDE for Markdown editing
- Propshaft asset pipeline
- SQLite3 database
- Docker for production testing
