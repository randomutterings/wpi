ActionController::Routing::Routes.draw do |map|
  map.resources :statuses

  map.resources :listings
  
  map.resources :emails

  map.resources :leads

  map.resources :lead_statuses

  map.resources :lead_referral_types

  map.resources :lead_types

  map.resources :agents

  map.resources :pages

  map.root :controller => "pages", :action => "show"
  
  map.page 'page/:permalink', :controller => 'pages', :action => 'show'
  
  map.agent 'agent/:permalink', :controller => 'agents', :action => "show"
  
  map.listing 'listing/:permalink', :controller => 'listings', :action => "show"
  
end