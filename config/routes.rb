OTTS::Application.routes.draw do
  devise_for :users

  resources :quizzes
  resources :questions



  #resources :admin, :only =>[] do
   #   put :markquestions
    #  put :unmarkquestions
     # post :assignquestions
    #end

#  resources :teacher, :only =>[] do
 #     put :markstudents
  #    put :unmarkstudents
   #   post :assignstudents
   # end 

 # resources :student, :only =>[:index] do
  #   member do
   #   post :startquiz
    #  post :endquiz
   # end  
   # end

 match 'admin/assignquestions', to: 'admin#assignquestions'
  match 'admin/markquestions', to: 'admin#markquestions', via: [:put]
  match 'admin/unmarkquestions', to: 'admin#unmarkquestions', via: [:put]
  match 'teacher/assignstudents', to: 'teacher#assignstudents'
  match 'teacher/markstudents', to: 'teacher#markstudents', via: [:put]
  match 'teacher/unmarkstudents', to: 'teacher#unmarkstudents', via: [:put]
  match 'student/startquiz', to: 'student#startquiz'
  match 'student/endquiz', to: 'student#endquiz'
  match 'student/index', to: 'student#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   #root :to =>  new_user_session

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  
end
