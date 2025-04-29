module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/assets/tailwind/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      // All colors are now using Tailwind's built-in color palette
      // Primary UI colors:
      // - Blue: blue-600 (#2563eb) - Primary actions, links
      // - Green: green-500 (#22c55e) - Success, submit buttons
      // - Red: red-600 (#dc2626) - Warnings, destructive actions
      // 
      // UI backgrounds:
      // - Navbar: white (#ffffff)
      // - Footer: gray-100 (#f3f4f6)
      // - Body: white (#ffffff)
      //
      // Text colors:
      // - Base text: gray-900 (#111827)
      // - Muted text: gray-500 (#6b7280)
      // - Light text: gray-400 (#9ca3af)
    },
  },
  plugins: [],
}
