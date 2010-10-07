ActiveRecord::Base.send :include, Inkling::Types::ActsAs

#add to view load paths for theming
ActionController::Base.append_view_path(Inkling::Theme::INKLING_THEMES)
