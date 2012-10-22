require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Event aspect Extension
#
module Huasi

  class EventExtension < Plugins::ViewListener
    include ContentManagerSystem::Support

    # ========= Aspects ==================
    
    #
    # Retrieve an array of the aspects defined in the plugin
    #
    # The attachment aspect (complement)
    #
    def aspects(context={})
      
      app = context[:app]
      
      aspects = []
      aspects << ::Plugins::Aspect.new(:event, app.t.aspect.event, [:entity], EventAspectDelegate.new)
                                               
      return aspects
       
    end    
    
  end
end