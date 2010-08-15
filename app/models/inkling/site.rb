module Inkling
  class Site < ActiveRecord::Base
    has_many :addresses
  end
end
