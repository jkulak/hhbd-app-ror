ActionController::Routing::Routes.draw do |map|
  map.resources :band_memberships
  map.resources :track_appearances
  map.resources :songs, :as => 'utwory'
  map.resources :labels, :as => 'wytwornie'
  map.resources :artists, :as => 'wykonawcy'
  map.resources :albums, :as => 'albumy'  

  # Sample resource route within a namespace:
     map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
       admin.resources :albums
     end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
