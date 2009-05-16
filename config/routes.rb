ActionController::Routing::Routes.draw do |map|
  map.resources :avatars

  map.resources :avatars

  map.php '/avatar.php', :controller => 'avatars', :action => 'show', :format => 'png'
  map.root :controller => 'avatars'
end
