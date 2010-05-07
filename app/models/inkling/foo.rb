#a test content type for including within a folder
module Inkling
  class Foo < ActiveRecord::Base
    include Inkling::Content

    has_one :folder_entry, :as => :content
  end
end
