# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bubu::Application.initialize!
Haml::Template.options[:format] = :xhtml
Paperclip.options[:command_path] = "/usr/bin/"
