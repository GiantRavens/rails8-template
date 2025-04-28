namespace :admin do
  desc "Make a user an admin by email"
  task :create, [:email] => :environment do |t, args|
    if args[:email].blank?
      puts "Error: Email is required"
      puts "Usage: rails admin:create[user@example.com]"
      exit 1
    end
    
    user = User.find_by(email: args[:email])
    
    if user.nil?
      puts "Error: User with email '#{args[:email]}' not found"
      exit 1
    end
    
    if user.is_admin?
      puts "User '#{user.email}' is already an admin"
    else
      user.update(is_admin: true)
      puts "User '#{user.email}' is now an admin"
    end
  end
  
  desc "List all admin users"
  task list: :environment do
    admins = User.where(is_admin: true)
    
    if admins.empty?
      puts "No admin users found"
    else
      puts "Admin users:"
      admins.each do |admin|
        puts "- #{admin.email} (#{admin.full_name})"
      end
    end
  end
end
