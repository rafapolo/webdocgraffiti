Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '380422978692298', 'fa0f216f04559ca412377b4754f41acb', {:client_options => {:ssl => {:verify => false}}, 
  :scope => 'user_about_me'}
end