ActionController::Routing::Routes.draw do |map|
  
  map.resource :search
  map.resources :posts

  map.resources :articles, :as => 'newsy'
  map.resources :users

  map.resource :session, :controller => 'session'

  map.resources :nicknames
  map.resources :band_memberships
  map.resources :track_appearances
  map.resources :songs, :as => 'utwory'
  map.resources :labels, :as => 'wytwornie'
  map.resources :artists, :as => 'wykonawcy'
  map.resources :albums, :as => 'albumy'
  
  # map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'
  
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
