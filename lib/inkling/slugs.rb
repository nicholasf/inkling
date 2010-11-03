module Inkling::Slugs
  #copied from enki see http://www.enkiblog.com/
  
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
end