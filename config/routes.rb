ActionController::Routing::Routes.draw do |map|
  map.resources :documents

  map.signup 'signup', :controller => 'accounts', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.resources :sessions

  map.resources :accounts

  map.resources :articles

  map.resources :photos

  map.resources :statuses

  map.resources :listings
  
  map.resources :emails

  map.resources :leads

  map.resources :lead_statuses

  map.resources :lead_referral_types

  map.resources :lead_types

  map.resources :agents

  map.resources :pages

  map.root :controller => "pages", :action => "show", :permalink => "home"
  
  map.page_permalink 'pages/link/:permalink', :controller => 'pages', :action => 'show'
  
  map.agent_permalink 'agents/link/:permalink', :controller => 'agents', :action => "show"
  
  map.listing_permalink 'listings/link/:permalink', :controller => 'listings', :action => "show"
  
end