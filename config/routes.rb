Rails.application.routes.draw do |map|
  namespace :inkling do
    namespace :admin do
      resources :paths, :users, :roles
      match 'proxy_new' => 'proxying#new', :as => :proxy_new
      match 'proxy_edit' => 'proxying#edit', :as => :proxy_edit
      match 'proxy_delete' => 'proxying#delete', :as => :proxy_delete
      
      match 'update_tree' => 'paths#update_tree', :as => :update_tree
    end
  end
  
  match 'home', :to => 'inkling/home#dashboard', :as => "inkling_user_root"  
  
  namespace :inkling do
    devise_for "users", :controllers => { :sessions => "inkling/users/sessions", :passwords => "inkling/users/passwords", :confirmations => "inkling/users/confirmations"}, :class_name => "Inkling::User"
  end 
end
