# frozen_string_literal: true

require 'bigbluebutton_api'

namespace :user do
  desc "Creates a user account"
  task :create, [:name, :email, :password, :role, :phone_number, :invite_code, :provider] => :environment do |_task, args|
    u = {
      name: args[:name],
      password: args[:password],
      email: args[:email],
      role: args[:role] || "user",
      phone_number: args[:phone_number],
      invite_code: args[:invite_code],
      provider: args[:provider] || "greenlight"
    }

    if u[:role] == "admin"
      # Set default variables
      u[:name] = "Administrator" if u[:name].blank?
      u[:password] = Rails.configuration.admin_password_default if u[:password].blank?
      u[:email] = "admin@example.com" if u[:email].blank?
      u[:phone_number] = "0000000000" if u[:phone_number].blank?
      u[:invite_code] = 99999 if u[:invite_code].blank?
    elsif u[:name].blank? || u[:password].blank? || u[:email].blank? || u[:phone_number].blank? || u[:invite_code].blank?
      # Check that all fields exist
      puts "Missing Arguments"
      exit
    end
    u[:email].prepend "superadmin-" if args[:role] == "super_admin"

    # Create account if it doesn't exist
    if !User.exists?(email: u[:email], provider: u[:provider])
      user = User.create(name: u[:name], email: u[:email], password: u[:password],
        phone_number: u[:phone_number], invite_code: u[:invite_code] ,provider: u[:provider], email_verified: true)

      unless user.valid?
        puts "Invalid Arguments"
        puts user.errors.messages
        exit
      end

      if u[:role] == "super_admin"
        user.remove_role(:user)
        user.add_role(:super_admin)
      elsif u[:role] == "admin"
        user.add_role(:admin)
      end

      puts "Account succesfully created."
      puts "Email: #{u[:email]}"
      puts "Password: #{u[:password]}"
      puts "Role: #{u[:role]}"
      puts "PLEASE CHANGE YOUR PASSWORD IMMEDIATELY" if u[:password] == Rails.configuration.admin_password_default
    else
      puts "Account with that email already exists"
      puts "Email: #{u[:email]}"
    end
  end
end
