
Rails.application.routes.draw do |map|
  resources :folders, :controller => 'inkling/folders'
  resources :inkling_folders, :controller => 'inkling/folders'
  #here so _path helpers can work out from the object the correct route

    # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  match 'proxy_content_creation' => 'inkling/content_proxy#proxy', :as => :proxy_content_creation
end