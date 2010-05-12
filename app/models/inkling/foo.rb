#a test content type for including within a folder
module Inkling
  class Foo < ActiveRecord::Base
    acts_as_content "Foo"
  end
end
