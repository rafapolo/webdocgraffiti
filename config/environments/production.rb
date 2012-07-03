Webdoc::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.digest = true
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify

  # compress assets
  config.assets.enabled = true
  config.assets.js_compressor = Uglifier.new(:inline_script=>true, :copyright=>false)
  config.assets.css_compressor = :yui
  config.assets.compress = true
  config.assets.compile = true
end