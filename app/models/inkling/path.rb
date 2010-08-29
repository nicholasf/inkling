require 'better_nested_set'

module Inkling
  class Path < ActiveRecord::Base
    include SymetrieCom::Acts::NestedSet
    acts_as_nested_set
    
    belongs_to :content, :polymorphic => true

    before_validation :update_path!
    validate :path_unique?


    #called before adding a new child path to see if the content object restricts what it's path should nest
    #if there isn't a restricts() impl. on the content object, false is returned, allowing anything to be nested
    def restricts?(sub_path)
      if self.content
        self.content.restricts?(sub_path.content) if self.content.respond_to? :restricts?
      else
        false
      end
    end

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
