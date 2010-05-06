#a test content type for including within a folder

class Foo < ActiveRecord::Base
  include Inkling::Content
  belongs_to :content, :polymorphic => true
end
