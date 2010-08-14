namespace :inkling do
  desc "Create a default user with login 'admin' and password 'admin'"
  task :default_admin => [:environment] do
    Inkling::User.create!(:email => "admin@localhost.com", :password => "test123", :password_confirmation => "test123")
  end
end