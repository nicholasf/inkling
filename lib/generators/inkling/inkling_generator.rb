require 'rails/generators'

 class CfFooGenerator < Rails::Generators::Base
   include Rails::Generators::Migration

   desc "Initializes CF Foo and generates migrations"

   def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
   end

   def self.next_migration_number(dirname)
     if ActiveRecord::Base.timestamped_migrations
       Time.now.utc.strftime("%Y%m%d%H%M%S")
     else
       "%.3d" % (current_migration_number(dirname) + 1)
     end
   end

   def create_migration_file
     migration_template 'create_cf_users.rb', 'db/migrate/create_cf_users_table.rb'
   end
 end
