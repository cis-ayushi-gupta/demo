Rails.application.routes.draw do

  
   devise_for :users, :path => '/user', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  devise_for :admins, :path => '/admin', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  
  root 'users#index'
   namespace :admin do
    root 'home#show'
    get '/index' => 'home#index'
    get '/show' => 'users#user_name', as: 'user_name'
    get '/detail/:user_id' => 'users#user_detail', as: 'user_detail'
     get '/marks/:user_id' => 'users#view_marks', as: 'view_marks'
    resources :courses, only: [:index] do
      resources :testpapers, only: [:new, :create] 
        # get '/' => 'testpapers#create_questions', as: 'create_questions'
    # end
    end
    resources :testpapers, only: [:destroy, :edit] 
    get '/tests/:id/questions' => 'testpapers#create_questions', as: 'questions'
    post '/tests/:id/question' => 'testpapers#save_questions', as: 'question'
    post '/tests/:test_id/question/:question_id' => 'testpapers#update'
   get '/tests/:test_id' => 'testpapers#select_question', as: 'select_question'
   get '/test/:id' => 'testpapers#view_test', as: 'view_test'
   get '/:id' => 'testpapers#active_paper', as: 'active_paper'
  end
 get '/testpaper/:test_id' => 'users#instruction', as: 'instruction'
 get '/tests/:test_id/testpaper' => 'users#give_test', as: 'give_test'
 get '/tests/:test_id/:question_detail_id/testpaper' => 'users#save_data_in_session', as: 'save_data_in_session'
 get '/result/:test_id' => 'users#calculate_marks', as: 'calculate_marks'
 get '/error' => 'users#error', as: 'error'
 get '/:test_id/review' => 'users#review', as: 'review'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
