require 'rails/generators'

 class InklingGenerator < Rails::Generators::Base
   include Rails::Generators::Migration

   desc "Initializes Inkling and generates migrations"

   #this is ugly, but I'll take it for now if it works
#   invoke "migration", %(create_inkling_users )

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    puts " *******"
  end

  def self.next_migration_number(dirname)
    puts "hello!"
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    puts "I'm creating!"
    migration_template 'create_inkling_users.rb', 'db/migrate/create_inkling_users.rb'
    migration_template 'create_inkling_folders.rb', 'db/migrate/create_inkling_folders.rb'
  end
 end
