Webdoc::Application.routes.draw do  
  resources :episodios  
  resources :blocos
  resources :hiperbalons
  resources :marcadors
  resources :tags
  
  namespace :admin do
    get :episodios
  end

  match "/videos" => "pages#videos"
  match "/mapa" => "pages#mapa"
  match "/info" => "pages#info"
  match "/player" => "pages#player"
  
  match "/oauth" => "pages#oauth"
  match "/marcadores" => "marcadors#index"

  match "/admin" => "admin#episodios", :as => :admin
	match "/admin/marcadores" => "admin#marcadores"

  match "/:episodio/:bloco" => "pages#player"
  
  root :to => 'pages#index'
end
