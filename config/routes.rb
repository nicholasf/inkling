
Rails.application.routes.draw do |map|

  namespace :admin do
    namespace :inkling do
      resources :folders, :controller => 'folders'
      resources :foos, :controller => 'foos'
    end
  end

  match 'proxy_content_creation' => 'admin/inkling/content_proxy#proxy', :as => :proxy_content_creation
end