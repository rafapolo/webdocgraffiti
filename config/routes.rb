Webdoc::Application.routes.draw do
  resources :georefs
  resources :ensaios
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
  
  match "/admin" => "admin#episodios"
	match "/admin/mapas" => "admin#mapas"
  
  root :to => 'pages#index'
end
