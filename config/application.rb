require File.expand_path('../boot', __FILE__)
require './lib/extend_string'
require 'rails/all'
require 'openssl'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Webdoc
  class Application < Rails::Application
    config.i18n.default_locale = "pt_BR"
    config.encoding = "utf-8"
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end
