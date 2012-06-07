require 'ysd-plugins' unless defined?Plugins::Plugin
require 'ysd_plugin_content_contact_extension'

Plugins::SinatraAppPlugin.register :content_contact do

   name=        'content contact'
   author=      'yurak sisa'
   description= 'Add contact information to the content'
   version=     '0.1'
   hooker       Huasi::ContentContactExtension
   sinatra_extension Sinatra::ContentContact
end

