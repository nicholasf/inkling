
Rails.application.routes.draw do |map|
   resources :folders, :controller => 'inkling/folders'
   resources :inkling_folders, :controller => 'inkling/folders' #here so _path helpers can work out from the object the
                                                  #correct route
end

