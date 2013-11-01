Vim�UnDo� |e�8��wua�=�v�o�74	������B�\4P   �                                   Q�A}     _�                      .        ����                                                                                                                                                                                                                                                                                                                                         %       v   %    Q�A|     �               �   3HopprMerchantsSelfServe::Application.routes.draw do          root :to => "home#index"     ActiveAdmin.routes(self)       5  devise_for :admin_users, ActiveAdmin::Devise.config   J  devise_for :members, :controllers => { :sessions => "members/sessions" }   N  devise_for :users, :controllers => {:registrations => "users/registrations"}        e  match '/redeemed_coupons/errors/invalid_coupon' => 'redeemed_coupons#error_message', :via => [:get]   g  match '/redeemed_coupons/get_coupon_details' => 'redeemed_coupons#get_coupon_details', :via => [:get]   �  match '/redeemed_coupons/coupon_download_report' => 'redeemed_coupons#coupon_download_report', :as => "coupon_download_report"   �  match '/redeemed_coupons/search_coupon_download' => 'redeemed_coupons#search_coupon_download', :as => "search_coupon_download"     resources :redeemed_coupons       q  match '/communication_forms/get_collateral_image' => 'communication_forms#get_collateral_image', :via => [:get]      resources :communication_forms       8  match '/all_checkins' => 'checkin#all', :via => [:get]       ;  match '/places/search' => 'places#search', :via => [:get]   Y  match '/places/load_high_focus_areas' => "places#load_high_focus_areas", :via => [:get]   S  match '/places/check_availability' => "places#check_availability", :via => [:get]   O  match '/merchants/get_merchants' => 'merchants#get_merchants', :via => [:get]   L  match '/merchants/get_sidebar' => 'merchants#get_sidebar', :via => [:post]   c  match '/admin/recommendations/recommend' => 'admin/recommendations#recommend', :as => "recommend"   �  match '/admin/recommendations/create_recommendation' => 'admin/recommendations#create_recommendation', :as => "create_recommendation"   �  match '/admin/recommendations/:id/update_recommendation' => 'admin/recommendations#update_recommendation', :as => "update_recommendation"   j  match '/admin/place_claims/:id/edit_keyword' => 'admin/place_claims#edit_keyword', :as => "edit_keyword"   p  match '/admin/place_claims/:id/update_keyword' => 'admin/place_claims#update_keyword', :as => "update_keyword"   v  match '/admin/sidebar_contents/new_content_box' => 'admin/sidebar_content#new_content_box', :as => "new_content_box"     match '/admin/sidebar_contents/create_content_box' => 'admin/sidebar_content#create_content_box', :as => "create_content_box"   v  match '/admin/sidebar_contents/map_content_box' => 'admin/sidebar_content#map_content_box', :as => "map_content_box"   m  match '/admin/sidebar_contents/save_mapping' => 'admin/sidebar_content#save_mapping', :as => "save_mapping"   L  match '/user/tips_index' => 'users#tips_index', :as => "tips_for_merchant"   _  match '/user/:id/show_recommendation' => 'users#show_recommendation', :as => "recommendation"     resource :members do       collection do         get :rm_list         post :rm_verify         get :oe_list         post :oe_verify       end     end         resources :tasks     resources :places     resources :place_claims     resources :merchants do       member do         get :get_places       end     end     resources :dashboard   n  match 'dashboard/:id/place_visit' => 'dashboard#place_visit', :via => [:get], :as => "dashboard_place_visit"   q  match 'dashboard/:id/offer_coupon' => 'dashboard#offer_coupon', :via => [:get], :as => "dashboard_offer_coupon"   g  match 'dashboards/merchant_offers' => 'dashboard#merchant_offers', :as => "dashboard_merchant_offers"     resources :products     resources :merchant_contacts   e  match '/merchant_contact/:id' => 'merchant_contacts#show', :via => [:get], :as => :merchant_contact   h  match '/merchant_contacts/:id' => 'merchant_contacts#update', :via => [:put], :as => :merchant_contact   '  resources :offers, :except => [:show]   q  match '/offers/remove_coupons/:id' => 'offers#coupons_to_remove', :as => :remove_coupons_offer,  :via => [:get]   L  match '/offers/remove_coupons' => 'offers#remove_coupons', :via => [:post]   E  match '/offers/:id' => 'offers#show', :via => [:get], :as => :offer   e  match '/offer/active_offers' => 'offers#active_offers', :via => [:get], :as => "view_active_offers"       !  resources :coupon_custom_fields   U  match '/user/verify_mobile_number' => 'users#verify_mobile_number', :via => [:post]   ]  match '/user/request_new' => 'users#request_new', :via => [:get], :as => 'user_request_new'   I  match '/user/request_create' => 'users#request_create', :via => [:post]   :  match '/user/profile' => 'users#profile', :via => [:get]   f  match '/user/edit_password' => 'users#edit_password', :via => [:get], :as => "edit_profile_password"   T  match '/user/update_password' => 'users#update_password', :as => "update_password"   D  match '/user/list' => 'users#list', :via => [:get], :as => "users"   E  match '/user/new' => 'users#new', :via => [:get], :as => "new_user"   M  match '/users/:id/edit' => 'users#edit', :via => [:get], :as => "edit_user"   \  match '/users/:id/self_edit' => 'users#self_edit', :via => [:get], :as => "self_edit_user"   9  match '/users/update' => 'users#update',:as => "update"   9  match '/user/create' => 'users#create', :via => [:post]   B  match '/user/:id' => 'users#show', :via => [:get], :as => "user"   ]  match '/merchant/:name' => "products#merchants", :via => [:get], :as => "merchant_products"   �  match '/:merchant/:name' => 'products#merchants', :via => [:get], :as => "merchant_products", :constraints => { :merchant => /merchant/i }   [  match '/place/display_image/:file_name' => "places#display_image", :as => "display_image"   Q  match '/places/download/:file' => "places#download", :as => "download_document"   h  match '/place_claims/edit_place/:id' => "place_claims#edit_place", :as => "edit_place_and_place_claim"   n  match '/place_claims/update_place/:id' => "place_claims#update_place", :as => "update_place_and_place_claim"   X  match '/product/get_image/:file_name' => "products#get_image", :as => "download_image"     #    1  # The priority is based upon order of creation:   &  # first created -> highest priority.         # Sample of regular route:   ,  #   match 'products/:id' => 'catalog#view'   I  # Keep in mind you can assign values other than :controller and :action         # Sample of named route:   K  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase   B  # This route can be invoked with purchase_url(:id => product.id)       P  # Sample resource route (maps HTTP verbs to controller actions automatically):     #   resources :products       '  # Sample resource route with options:     #   resources :products do     #     member do     #       get 'short'     #       post 'toggle'     #     end     #     #     collection do     #       get 'sold'     #     end   	  #   end       -  # Sample resource route with sub-resources:     #   resources :products do   #  #     resources :comments, :sales     #     resource :seller   	  #   end       9  # Sample resource route with more complex sub-resources     #   resources :products do     #     resources :comments     #     resources :sales do   *  #       get 'recent', :on => :collection     #     end   	  #   end       -  # Sample resource route within a namespace:     #   namespace :admin do   @  #     # Directs /admin/products/* to Admin::ProductsController   8  #     # (app/controllers/admin/products_controller.rb)     #     resources :products   	  #   end       9  # You can have the root of your site routed with "root"   .  # just remember to delete public/index.html.     # root :to => 'welcome#index'       6  # See how all your routes lay out with "rake routes"       [  # This is a legacy wild controller route that's not recommended for RESTful applications.   [  # Note: This route will make all actions in every controller accessible via GET requests.   1  # match ':controller(/:action(/:id))(.:format)'   end5��