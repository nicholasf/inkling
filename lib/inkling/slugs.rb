module Inkling
  module Slugs
    #copied from enki see http://www.enkiblog.com/  
    def sluggerize(slug)
      text = slug.dup
      text.downcase!
      text.gsub!(/&(\d)+;/, '') # Ditch Entities
      text.gsub!('&', 'and') # Replace & with 'and'
      text.gsub!(/['"]/, '') # replace quotes by nothing
      text.gsub!(/\ +/, '-') # replace all white space sections with a dash
      text.gsub!(/(-)$/, '') # trim dashes
      text.gsub!(/^(-)/, '') # trim dashes
      text.gsub!(/[^\/a-zA-Z0-9\-]/, '-') # Get rid of anything we don't like
      text
    end
  end
end