# Rails 8 Starter Template

A production-ready Rails 8 template with modern tooling and best practices. This template provides a solid foundation for building secure, scalable web applications with a focus on developer experience and maintainability.

## 🚀 Features

### Core Stack
- **Rails 8** - The latest version of Ruby on Rails
- **Hotwire (Turbo + Stimulus)** - Modern, fast web applications with minimal JavaScript
- **ImportMap** - Modern JavaScript without a build step
- **Propshaft** - The modern asset pipeline for Rails
- **SQLite** (development) / **PostgreSQL** (production ready)
- **Tailwind CSS** - Utility-first CSS framework
- **Devise** - Flexible authentication solution
- **Docker** & **Kamal** - Containerized deployment

### Developer Experience
- **Hot Reloading** - Automatic browser refresh with esbuild
- **Debugging** - Integrated debugger and better_errors
- **Testing** - Minitest with fixtures and system tests
- **Code Quality** - RuboCop and Brakeman integration
- **Security** - Secure defaults and CSP ready
- **Performance** - SolidCache and SolidQueue for production

### Production Ready
- **Docker** support for consistent environments
- **Kamal** for zero-downtime deployments
- **Asset Optimization** - Precompilation and fingerprinting
- **Security Headers** - Secure by default
- **Logging** - Structured logging in production

## 🛠️ Getting Started

### Prerequisites
- Ruby 3.3.0+
- Node.js 18+
- Yarn 1.22+
- SQLite3 (development)
- Docker (for containerized development)

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/rails8-template.git
   cd rails8-template
   ```

2. **Install dependencies**
   ```bash
   bundle install
   yarn install
   ```

3. **Set up the database**
   ```bash
   rails db:create db:migrate
   ```

4. **Start the development server**
   ```bash
   bin/dev
   ```
   Visit [http://localhost:3000](http://localhost:3000)

### Docker Development

```bash
# Build and start the containers
docker-compose up --build

# Run database migrations
docker-compose exec web rails db:create db:migrate

# Access the Rails console
docker-compose exec web rails console
```

## 👨‍💻 Set Up Admin User

Follow these steps to create and configure an admin user:

1. **Install dependencies** (if not already done):
   ```bash
   bundle install
   ```

2. **Start the mailcatcher server** in a new terminal tab:
   ```bash
   # Start mailcatcher (installed via Homebrew)
   mailcatcher
   ```
   > Access mailcatcher at [http://127.0.0.1:1080](http://127.0.0.1:1080) to view emails
   >
   > To run mailcatcher in the background and start on login:
   > ```bash
   > brew services start mailcatcher
   > ```

3. **Start the Rails server** in another terminal:
   ```bash
   bin/dev
   ```

4. **Register a new user**:
   - Visit [http://localhost:3000/users/sign_up](http://localhost:3000/users/sign_up)
   - Fill in the registration form
   - Submit the form

5. **Confirm your email**:
   - Open mailcatcher at [http://127.0.0.1:1080](http://127.0.0.1:1080)
   - Find the confirmation email and click the confirmation link

6. **Make the user an admin**:
   Open a new terminal and run:
   ```bash
   rails console
   ```
   Then in the Rails console:
   ```ruby
   # Replace with the email you used to sign up
   user = User.find_by(email: 'your-email@example.com')
   
   # Make the user an admin
   user.update!(is_admin: true)
   ```

7. **Access admin features**:
   - Log out and log back in
   - You should now see additional admin navigation options
   - The admin dashboard is available at `/admin`

> **Note**: The admin interface includes user management, content moderation, and other administrative functions.

## 🚀 Deployment

### Prerequisites
- Docker installed on your server
- A domain name with DNS access
- SSH access to your server

### Deploy with Kamal

1. **Configure deployment**
   ```bash
   cp .env.example .env
   # Edit .env with your production values
   ```

2. **Initialize Kamal**
   ```bash
   kamal init
   # Edit config/deploy.yml with your server details
   ```

3. **Deploy!**
   ```bash
   kamal setup
   kamal deploy
   ```

## 🛡️ Security

### Environment Variables
Never commit sensitive information. Use `.env` for local development and set environment variables in production.

### Security Headers
Security headers are enabled by default in production. Review `config/application.rb` for details.

### Content Security Policy (CSP)
A basic CSP is configured in `config/initializers/content_security_policy.rb`. Customize it based on your needs.

## 🧪 Testing

```bash
# Run all tests
bin/rails test

# Run system tests
bin/rails test:system

# Run a specific test file
bin/rails test test/models/user_test.rb
```

## 📦 Dependencies

### Gems
- `devise` - Authentication
- `tailwindcss-rails` - CSS framework
- `solid_cache` & `solid_queue` - Caching and background jobs
- `importmap-rails` - Modern JavaScript with import maps
- `turbo-rails` - SPA-like page navigation
- `stimulus-rails` - Minimal JavaScript framework

### JavaScript Packages

As you get more picky/advanced you can move to esbuild, etc.

- `@hotwired/turbo-rails`
- `@hotwired/stimulus`
- `@tailwindcss/forms`
- `esbuild`

## 📂 Project Structure

```
app/
├── assets/           # Styles, images, and JavaScript
├── channels/         # ActionCable channels
├── controllers/      # Controllers
├── helpers/          # View helpers
├── jobs/             # Background jobs
├── mailers/          # Email templates and mailers
├── models/           # Models and business logic
└── views/            # View templates

config/
├── initializers/    # Rails and gem configurations
├── locales/         # Internationalization
└── environments/    # Environment-specific settings

db/
├── migrate/        # Database migrations
└── schema.rb       # Current database schema
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- The Rails team for an amazing framework
- The open-source community for their contributions
- All contributors who help improve this template
