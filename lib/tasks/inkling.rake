namespace :inkling do
  desc "Create a default user with login 'admin' and password 'admin'"
  task :default_admin => [:environment] do
    user = Inkling::User.new(:login => "admin", :email => "admin@localhost.com", :password => "admin", :confirmation_password => "admin")
    user.encrypt_password
    user.save!
  end
end