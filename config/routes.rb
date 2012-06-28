Webdoc::Application.routes.draw do
  resources :georefs
  resources :tags
  resources :capitulos
  resources :episodios  
  resources :blocos
  
  namespace :admin do
    get :episodios
  end

  match "/videos" => "pages#videos"
  match "/mapa" => "pages#mapa"
  match "/info" => "pages#info"
  match "/player" => "pages#player"
  
  match "/oauth" => "admin#oauth"

  match "/admin" => "admin#episodios", :as => :admin
	match "/admin/mapas" => "admin#mapas"

  match "/:episodio/:bloco" => "pages#player"
  
  root :to => 'pages#index'
end
