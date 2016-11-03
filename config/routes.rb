Rails.application.routes.draw do
  devise_for :admins
  resources :users do
      member do
        get :confirm_email
        get :change_category_page
      end
    end
  root 'users#about'
  get 'about' => 'users#about'
  get 'sponsor' => 'users#sponsor_page'
  get 'host' => 'users#host_page'
  get 'entrepreneur' => 'users#entrepreneur_page'
  get 'confirmation' => 'users#confirmation_page'

  get 'confirmed_email_fashionista' => 'users#confirmed_email_page_fashionista'
  get 'confirmed_email_sponsor' => 'users#confirmed_email_page_sponsor'
  get 'confirmed_email_host' => 'users#confirmed_email_page_host'
  get 'confirmed_email_streamer' => 'users#confirmed_email_page_streamer'

  patch 'submit_questionnaire' => 'users#submit_questionnaire'
  get 'thank_you_for_answers' => 'users#thank_you_for_answers'

  get 'imprint' => 'users#imprint'
  get 'change_category_page' => 'users#change_category_page'
  get 'change_category_confirmation' => 'users#change_category_confirmation'

  
  get 'resend_confirmation_email' => 'users#resend_confirmation_email'
  post 'resend' => 'users#resend'
  get 'resent_email_confirmation' => 'users#resent_email_confirmation'

  resources :recipients do
    collection { post :import }
  end

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
