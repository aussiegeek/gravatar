ActionController::Routing::Routes.draw do |map|
  map.resources :avatars
  map.avatar '/avatar/:id.:format', :controller => 'avatars', :action => 'show'
  map.php '/avatar.php', :controller => 'avatars', :action => 'show', :format => 'png'
  map.root :controller => 'avatars'
end
