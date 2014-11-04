OTTS::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :quizzes 
  resources :questions do 
    collection do 
      get :download
      post :import
    end
  end

  resources :wiki_pages do 
    collection do 
      get :named
    end
  end

 # match 'avatar/change_avatar_pic', to: 'avatar#change_avatar_pic'
  
  resources :avatars ,:only => [] do
    collection do
      put :change_Avatar_Pic
    end
  end
 
  resources :admin ,:only => []  do 
    collection do 
      get :assignquestions
      put :markquestions
      put :unmarkquestions
    end
  end

  resources :teacher ,:only => [] do 
    collection do 
      get :assignstudents
      put :markstudents
      put :unmarkstudents
    end
  end

  resources :student ,:only => [] do 
    collection do 
    get :index
    get :startquiz
    post :endquiz
  end 
end

  #match 'student/startquiz', to: 'student#startquiz'
  #match 'student/endquiz', to: 'student#endquiz'
  #match 'student/index', to: 'student#index'


  resources :conversations , :controller => 'conversations'  ,:path => 'conversations' do
  resources :messages
  end

  resources :books do
    member do
    put :takebook
    put :renew
    put :return
    put :pay
    end     
    collection do 
      get :adminbookportal
      get :userbookportal
    end
  end

 

  match 'applicationsearch/searchcontent' , to: 'applicationsearch#searchcontent' , via: [:get]

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
