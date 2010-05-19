
Rails.application.routes.draw do |map|

  namespace :admin do
    namespace :inkling do
      resources :folders, :controller => 'folders'
      resources :foos, :controller => 'foos'
    end
  end

  match 'proxy_admin_create' => 'admin/inkling/proxy_admin#proxy', :as => :proxy_admin_creation

  namespace :inkling do
    resources :foos, :controller => 'foos', :only => [:show]
   # match '/*folder_path(.:format)' => "proxy_show#proxy"
    match '/*folder_path' => "proxy_show#proxy" #this must be last in /inkling/* routing
  end
end
