require 'ysd_md_content'
require 'ysd_md_fieldset_event'

module ContentManagerSystem
  
  # Opens the class Content to include the event information
  class Content
    include FieldSet::Event
  end
  
end #ContentManagerSystem

