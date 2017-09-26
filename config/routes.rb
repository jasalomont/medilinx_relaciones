Rails.application.routes.draw do
  # Routes for the Broker_profile resource:
  # CREATE
  get "/broker_profiles/new", :controller => "broker_profiles", :action => "new"
  post "/create_broker_profile", :controller => "broker_profiles", :action => "create"

  # READ
  get "/broker_profiles", :controller => "broker_profiles", :action => "index"
  get "/broker_profiles/:id", :controller => "broker_profiles", :action => "show"

  # UPDATE
  get "/broker_profiles/:id/edit", :controller => "broker_profiles", :action => "edit"
  post "/update_broker_profile/:id", :controller => "broker_profiles", :action => "update"

  # DELETE
  get "/delete_broker_profile/:id", :controller => "broker_profiles", :action => "destroy"
  #------------------------------

  # Routes for the Broker_relation resource:
  # CREATE
  get "/broker_relations/new", :controller => "broker_relations", :action => "new"
  post "/create_broker_relation", :controller => "broker_relations", :action => "create"

  # READ
  get "/broker_relations", :controller => "broker_relations", :action => "index"
  get "/broker_relations/:id", :controller => "broker_relations", :action => "show"

  # UPDATE
  get "/broker_relations/:id/edit", :controller => "broker_relations", :action => "edit"
  post "/update_broker_relation/:id", :controller => "broker_relations", :action => "update"

  # DELETE
  get "/delete_broker_relation/:id", :controller => "broker_relations", :action => "destroy"
  #------------------------------

  # Routes for the Rx resource:
  # CREATE
  get "/rxes/new", :controller => "rxes", :action => "new"
  post "/create_rx", :controller => "rxes", :action => "create"

  # READ
  get "/rxes", :controller => "rxes", :action => "index"
  get "/rxes/:id", :controller => "rxes", :action => "show"

  # UPDATE
  get "/rxes/:id/edit", :controller => "rxes", :action => "edit"
  post "/update_rx/:id", :controller => "rxes", :action => "update"

  # DELETE
  get "/delete_rx/:id", :controller => "rxes", :action => "destroy"
  #------------------------------

  # Routes for the Prescription resource:
  # CREATE
  get "/prescriptions/new", :controller => "prescriptions", :action => "new"
  post "/create_prescription", :controller => "prescriptions", :action => "create"

  # READ
  get "/prescriptions", :controller => "prescriptions", :action => "index"
  get "/prescriptions/:id", :controller => "prescriptions", :action => "show"

  # UPDATE
  get "/prescriptions/:id/edit", :controller => "prescriptions", :action => "edit"
  post "/update_prescription/:id", :controller => "prescriptions", :action => "update"

  # DELETE
  get "/delete_prescription/:id", :controller => "prescriptions", :action => "destroy"
  #------------------------------

  devise_for :insurers
  # Routes for the Insurer resource:
  # READ
  get "/insurers", :controller => "insurers", :action => "index"
  get "/insurers/:id", :controller => "insurers", :action => "show"


  # Routes for the Event resource:
  # CREATE
  get "/events/new", :controller => "events", :action => "new"
  post "/create_event", :controller => "events", :action => "create"

  # READ
  get "/events", :controller => "events", :action => "index"
  get "/events/:id", :controller => "events", :action => "show"

  # UPDATE
  get "/events/:id/edit", :controller => "events", :action => "edit"
  post "/update_event/:id", :controller => "events", :action => "update"

  # DELETE
  get "/delete_event/:id", :controller => "events", :action => "destroy"
  #------------------------------

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
