ActionController::Routing::Routes.draw do |map|
  map.resources :avatars

  map.resources :avatars
  map.root :controller => 'avatars'
end
