ENV['RAILS_ENV'] ||= 'test'
require 'rubygems'
require 'spec'
require 'spec/rails'
require 'ruby-debug'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'inkling'


#this is a hack which I'll take away once spec/rails works on Rails 3
#at which stage I can set up transactional fixtures
#until then I'm cleaning the db up manually

module Monotonous
  def clean
    Inkling::Site.delete_all
    Inkling::Folder.delete_all
    Inkling::FolderEntry.delete_all
    Inkling::Foo.delete_all
#    Inkling::Role.delete_all
#    Inkling::Type.delete_all
    Inkling::User.delete_all
#    Inkling::Extension.delete_all
  end
end

include Monotonous
