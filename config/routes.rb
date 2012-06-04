Webdoc::Application.routes.draw do
  resources :georefs
  resources :ensaios
  resources :tags
  resources :capitulos
  resources :episodios

  namespace :admin do
    get :episodios
  end

  match "/videos" => "pages#videos"
  match "/mapa" => "pages#mapa"
  match "/info" => "pages#info"

  match "/player" => "pages#player"

  match "/admin" => "admin#episodios"
	match "/admin/galerias" => "admin#galerias"
	match "/admin/arquivos" => "admin#arquivos"
	match "/admin/blog" => "admin#blog"
	match "/admin/biografia" => "admin#biografia"
	match "/admin/contatos" => "admin#contatos"
  
  root :to => 'pages#index'
end
