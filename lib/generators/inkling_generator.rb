require 'rails/generators'

class InklingGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  source_root File.expand_path("../templates", __FILE__)

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    #this file should be lifted to class level, and other engines should be able to hook their migrations into it.
    
    inkling_migrations = [['create_inkling_tables.rb', 'db/migrate/create_inkling_tables.rb']]
    # migration_template 'create_inkling_tables.rb', 'db/migrate/create_inkling_tables.rb'
    for migration in inkling_migrations
      migration_template migration[0], migration[1]
    end
    
  end
end
