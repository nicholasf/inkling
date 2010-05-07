#a test content type for including within a folder

class Foo < ActiveRecord::Base
  include Inkling::Content

  has_one :folder_entry, :as => :content
end
