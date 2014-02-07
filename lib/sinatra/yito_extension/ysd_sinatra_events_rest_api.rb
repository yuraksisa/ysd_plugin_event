require 'ysd_md_cms' unless defined?ContentManagerSystem::Content

module Sinatra
  module YitoExtension
  	module EventsRESTApi

       def self.registered(app)
         
         #
         # Retrieve the contents which have the event aspect
         #
         app.get "/api/events" do
      
           from = params['start']
           to = params['end']

           ContentManagerSystem::ContentType.all.select do |content_type|
             content_type.applicable_aspects.include?(FieldSet::Event)
           end

           events = ContentManagerSystem::Content.all(
             :event_date_start.gte => Time.at(from.to_i),
             :event_date_start.lte => Time.at(to.to_i), 
             :publishing_state_id => 'PUBLISHED',
             :order => [:title.asc]).map do |content|
               {
               	:id => content.id,
                :title => "#{content.event_date_start.to_time.getlocal(content.event_time_zone).strftime('%H.%M %z')} #{content.title}",
                :start => content.event_date_start,
                :end => content.event_date_start,
                :url => content.path,
                :editable => false,
                :backgroundColor => 'rgb(41, 158, 69)',
                :textColor => 'white'
               }
           end

           events.to_json

         end

       end

  	end
  end
end