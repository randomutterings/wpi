ActionController::Routing::Routes.draw do |map|
  map.resources :emails

  map.resources :leads

  map.resources :lead_statuses

  map.resources :lead_referral_types

  map.resources :lead_types

  map.resources :agents

  map.resources :pages

  map.root :controller => "pages", :action => "show"
  
  map.static 'pages/:permalink', :controller => 'pages', :action => 'show'
  
  map.static ':agent', :controller => 'agents', :action => "show"
end