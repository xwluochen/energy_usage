Rails.application.routes.draw do
  #get 'dashboard/index'

  get 'dashboard/usage_filter'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get "/dashboard/usage_filter", to: "dashboard#usage_filter"

  root :to => 'dashboard#index'
end
