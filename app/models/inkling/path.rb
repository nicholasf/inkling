require 'better_nested_set'

module Inkling
  class Path < ActiveRecord::Base
    include SymetrieCom::Acts::NestedSet
    acts_as_nested_set    
    
    belongs_to :content, :polymorphic => true

    before_validation :update_path!, :unless => "self.content.nil?"
    validate :path_unique?

    def update_path!
      path = self.parent ? "#{self.parent.path}/" : "/"
      path += "#{self.content.name}"
      self.path = sluggerize(path)
    end

    #stolen from enki
    def sluggerize(slug)
      slug.downcase!
      slug.gsub!(/&(\d)+;/, '') # Ditch Entities
      slug.gsub!('&', 'and') # Replace & with 'and'
      slug.gsub!(/['"]/, '') # replace quotes by nothing
      slug.gsub!(/\ +/, '-') # replace all white space sections with a dash
      slug.gsub!(/(-)$/, '') # trim dashes
      slug.gsub!(/^(-)/, '') # trim dashes
      slug.gsub!(/[^\/a-zA-Z0-9\-]/, '-') # Get rid of anything we don't like
      slug
    end    
        
    def path_unique?
      pre_existing = Inkling::Path.find_by_path(self.path)

      if pre_existing and (self.new_record? or (pre_existing.id != self.id))
        self.errors.add("path (#{self.path}) already taken by another object in this website ")
      end
    end
  end
end
