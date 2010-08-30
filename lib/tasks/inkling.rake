namespace :inkling do

  desc "Triggers db:migrate:reset and inkling:init"
  task :rebuild => ["db:migrate:reset", "inkling:destroy_migrations", "inkling:generate", "inkling:init"]

  task :destroy_migrations do 
    system("rm -rf db/migrate/*")
  end
  
  task :generate do
    system("rails generate inkling")    
  end


  desc "Create a default user with login 'admin' and password 'admin'"
  task :default_admin => [:environment] do
    user = Inkling::User.create!(:email => "admin@localhost.com", :password => "test123", :password_confirmation => "test123")
    Inkling::RoleMembership.create!(:user => user, :role => Inkling::Role.find_by_name(Inkling::Role::ADMIN))
  end

  desc "Initializes inkling data."
  task :init => [:environment] do
    Inkling::Role.create!(:name => Inkling::Role::ADMIN)
    Rake::Task["inkling:default_admin"].execute
  end
end