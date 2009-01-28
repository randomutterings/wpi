ActionController::Routing::Routes.draw do |map|
  map.resources :pages

  map.root :controller => "pages", :action => "show", :permalink => "home"
  map.static ':permalink', :controller => 'pages', :action => 'show'
end