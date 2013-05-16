require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener
require 'ysd_md_fieldset_event'
require 'ysd_md_cms' unless defined?ContentManagerSystem::Content
require 'ysd-md-profile' unless defined?Users::Group

#
# Event aspect Extension
#
module Huasi

  class EventExtension < Plugins::ViewListener
    include ContentManagerSystem::Support

    # ========= Installation =================

    # 
    # Install the plugin
    #
    def install(context={})

      ContentManagerSystem::ContentType.first_or_create({:id => 'event'},
        {:name => 'Evento', 
         :description => 'Eventos',
         :publishing_workflow_id => 'standard',
         :usergroups => [Users::Group.get('staff')]})

      ContentManagerSystem::View.first_or_create({:view_name => 'events_page'},
       {
         :description => 'Published events page',
         :model_name => 'content',
         :query_conditions => {:field => 'type', :operator => '$eq', :value => 'event'},
         :query_order => [{:field => 'event_date_start', :order => :desc}],
         :query_arguments => [],
         :style => :teaser,
         :v_fields => [],
         :render => :teaser,
         :render_options => {},
         :view_limit => 0,
         :pagination => true,
         :ajax_pagination => false,
         :page_size => 25,
         :pager => :page_list,
         :block => false
       })
    
    end

    # ========= Aspects ==================
    
    #
    # Retrieve an array of the aspects defined in the plugin
    #
    # The attachment aspect (complement)
    #
    def aspects(context={})
      
      app = context[:app]
      
      aspects = []
      aspects << ::Plugins::Aspect.new(:event, app.t.aspect.event, FieldSet::Event, EventAspectDelegate.new)
                                               
      return aspects
       
    end    
    
  end
end