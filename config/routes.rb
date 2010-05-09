
Rails.application.routes.draw do |map|
   resources :folders, :controller => 'inkling/folders'
end

