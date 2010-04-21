module Inkling
  class ContentType < ActiveRecord::Base
    validates_uniqueness_of :name

  end
end
