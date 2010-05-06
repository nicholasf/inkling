module Inkling
  class Folder < ActiveRecord::Base

    acts_as_nested_set

    has_many :items, :as => :content
  end
end
