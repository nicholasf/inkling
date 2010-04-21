# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{inkling}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = %q{2010-04-21}
  s.extra_rdoc_files = [
    "README.txt"
  ]
  s.files = [
    "app/models/inkling/extension.rb",
     "app/models/inkling/folder.rb",
     "app/models/inkling/role.rb",
     "app/models/inkling/site.rb",
     "app/models/inkling/type.rb",
     "app/models/inkling/user.rb",
     "lib/generators/inkling/inkling_generator.rb",
     "lib/generators/inkling/templates/create_inkling_users.rb",
     "lib/inkling.rb",
     "lib/inkling/content.rb",
     "lib/inkling/engine.rb",
     "lib/mob.rb"
  ]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A content framework engine for Rails 3}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

