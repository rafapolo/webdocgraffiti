# Load the rails application
require File.expand_path('../application', __FILE__)

Paperclip.options[:command_path] = "~/Downloads/ImageMagick-6.7.7/bin"

# Initialize the rails application
Webdoc::Application.initialize!
