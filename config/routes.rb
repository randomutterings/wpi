ActionController::Routing::Routes.draw do |map|
  map.resources :agents

  map.resources :pages

  map.root :controller => "pages", :action => "show"
  
  map.static 'pages/:permalink', :controller => 'pages', :action => 'show'
  
  map.static ':agent', :controller => 'agents', :action => "show"
end