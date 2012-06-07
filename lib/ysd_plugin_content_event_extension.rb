require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Huasi Profile Extension
#
module Huasi

  class ContentContactExtension < Plugins::ViewListener
    include ContentManagerSystem::Support
   
    #
    # Information
    #
    def content_element_info(context={})
      app = context[:app]
      {:id => 'contact', :description => "#{app.t.content.content_contact.description}"} 
    end

    #
    # Renders the tab
    #
    def content_element_form_tab(context={})
      app = context[:app]
      info = content_element_info(context)
      render_tab("#{info[:id]}_form", info[:description])
    end

    #
    # Add fields to edit the photo information in the content form
    #
    def content_element_form(context={})
      
      app = context[:app]
      
      contact_form = <<-CONTACT_FORM
        <div id="#{content_element_info(context)[:id]}_form">
          <div class="formrow">
            <label for="contact_website" class="fieldtitle">Web site</label>
            <input type="text" maxlength="50" id="contact_website" name="contact_website" class="fieldcontrol" <%% if (entity) { %> value="<%%= entity.contact_website %>" <%% } %> />
          </div>
          <div class="formrow">
            <label for="contact_email" class="fieldtitle">Email</label>
            <input type="text" maxlength="30" id="contact_email" name="contact_email" class="fieldcontrol" <%% if (entity) { %> value="<%%= entity.contact_email %>" <%% } %> />
          </div>
          <div class="formrow">
            <label for="contact_phone_number" class="fieldtitle">Phone number</label>
            <input type="text" maxlength="15" id="contact_phone_number" name="contact_phone_number" class="fieldcontrol" <%% if (entity) { %> value="<%%= entity.contact_phone_number %>" <%% } %> />
          </div>
<div class="formrow">
            <label for="contact_mobile" class="fieldtitle">Mobile</label>
            <input type="text" maxlength="15" id="contact_mobile" name="contact_mobile" class="fieldcontrol" <%% if (entity) { %> value="<%%= entity.contact_mobile %>" <%% } %> />
          </div>
        </div>                              
      CONTACT_FORM
      
      if String.method_defined?(:encode)
        contact_form.encode!('UTF-8')
      end
        
      app.erb contact_form      
    
    end
        
    #
    # Renders the tab
    #
    def content_element_template_tab(context={})
      app = context[:app]
      info = content_element_info(context)
      render_tab("#{info[:id]}_template", info[:description])
    end    
    
    #
    # Show the photo information in the content render
    #
    def content_element_template(context={})
    
       app = context[:app]
    
       contact_template = <<-CONTACT_TEMPLATE
         <div id="#{content_element_info(context)[:id]}_template">
           <div class="entity-field"><span class="entity-fieldlabel">Web site</span> <span class="entity-fieldvalue"><%%= entity.contact_website %></span> </div>
           <div class="entity-field"><span class="entity-fieldlabel">Email</span> <span class="entity-fieldvalue"><%%= entity.contact_email %></span> </div>
           <div class="entity-field"><span class="entity-fieldlabel">Phone number</span> <span class="entity-fieldvalue"><%%= entity.contact_phone_number %></span> </div>
           <div class="entity-field"><span class="entity-fieldlabel">Mobile</span> <span class="entity-fieldvalue"><%%= entity.contact_mobile %></span> </div>
         </div>
       CONTACT_TEMPLATE
    
       if String.method_defined?(:encode)
        contact_template.encode!('UTF-8')
      end
        
      app.erb contact_template     
          
    end
    
  end
end