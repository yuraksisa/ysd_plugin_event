require 'ui/ysd_ui_fieldset_render' unless defined?UI::FieldSetRender

module Huasi
  #
  # Event aspect
  #
  class EventAspectDelegate
    include ContentManagerSystem::Support

    #
    # Custom representation (the attachments)
    #
    # @param [Hash] the context
    # @param [Object] the element
    #
    def custom(context={}, element, aspect_model)
    
      app = context[:app]
      
      renderer = ::UI::FieldSetRender.new('event', app)
      renderer.render('view','',{:element => element})
    
    end    

    # ========= Entity Management extension ========= 
    
    #
    # Information
    #
    def element_info(context={})
      app = context[:app]
      {:id => 'event', :description => "#{app.t.event.description}"} 
    end

    #
    # Renders the tab
    #
    def element_form_tab(context={}, aspect_model)
      app = context[:app]
      info = element_info(context)
      render_tab("#{info[:id]}_form", info[:description])
    end

    #
    # Add fields to edit the photo information in the content form
    #
    def element_form(context={}, aspect_model)
      
      app = context[:app]
      
      renderer = ::UI::FieldSetRender.new('event', app)      
      contact_form = renderer.render('form', 'em')    
      
    end

    #
    # Edition extension
    #
    def element_form_extension(context={}, aspect_model)
    
      app = context[:app]

      renderer = ::UI::FieldSetRender.new('event', app)      
      photo_form_extension = renderer.render('formextension', 'em')
        
              
    end
        
    #
    # Renders the tab
    #
    def element_template_tab(context={}, aspect_model)
      app = context[:app]
      info = element_info(context)
      render_tab("#{info[:id]}_template", info[:description])
    end    
    
    #
    # Show the photo information in the content render
    #
    def element_template(context={}, aspect_model)
    
       app = context[:app]
    
       renderer = ::UI::FieldSetRender.new('event', app)      
       contact_template = renderer.render('view', 'em')
                
    end

  
  end
end