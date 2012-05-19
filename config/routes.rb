Webdoc::Application.routes.draw do
  resources :georefs
  resources :ensaios
  resources :tags
  resources :capitulos
  resources :episodios

  root :to => 'pages#index'
end
