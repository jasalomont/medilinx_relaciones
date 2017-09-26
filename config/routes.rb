Rails.application.routes.draw do
  devise_for :patients
  # Routes for the Patient resource:
  # READ
  get "/patients", :controller => "patients", :action => "index"
  get "/patients/:id", :controller => "patients", :action => "show"


  devise_for :doctors
  # Routes for the Doctor resource:
  # READ
  get "/doctors", :controller => "doctors", :action => "index"
  get "/doctors/:id", :controller => "doctors", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
