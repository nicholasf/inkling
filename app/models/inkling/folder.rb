module Inkling
  class Folder < ActiveRecord::Base
    has_many :items, :as => :content
  end
end
