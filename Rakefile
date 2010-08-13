begin
  require "jeweler"
  require "./lib/inkling/version"
  Jeweler::Tasks.new do |gem|
    gem.name = "inkling"
    gem.summary = "A content framework engine for Rails 3"
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
    gem.version = Inkling::VERSION
    gem.add_dependency("devise")
  end
rescue
  puts "Jeweler or one of its dependencies is not installed."
end
