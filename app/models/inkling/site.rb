module Inkling
  class Site < ActiveRecord::Base
    has_many :folders
    has_one :user

    validates_uniqueness_of :name
  end
end
