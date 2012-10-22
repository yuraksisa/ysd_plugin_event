require 'ysd-plugins' unless defined?Plugins::Plugin

Plugins::SinatraAppPlugin.register :event do

   name=        'event'
   author=      'yurak sisa'
   description= 'Add event information to the content'
   version=     '0.1'
   hooker       Huasi::EventExtension
   sinatra_extension Sinatra::Event
end

