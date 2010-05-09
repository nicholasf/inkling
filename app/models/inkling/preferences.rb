module Inkling
  class Preferences < ActiveRecord::Base

    @@singleton = nil

#    def self.single_site
#
#    end

    private
    def get_singleton
      @@singleton = Preferences.all.first
    end
  end
end
