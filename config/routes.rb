Webdoc::Application.routes.draw do
  resources :georefs
  resources :ensaios
  resources :tags
  resources :capitulos
  resources :episodios

  	match "/admin" => "admin#episodios"
	match "/admin/galerias" => "admin#galerias"
	match "/admin/arquivos" => "admin#arquivos"
	match "/admin/blog" => "admin#blog"
	match "/admin/biografia" => "admin#biografia"
	match "/admin/contatos" => "admin#contatos"

  root :to => 'pages#index'
end
