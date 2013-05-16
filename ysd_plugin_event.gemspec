Gem::Specification.new do |s|
  s.name    = "ysd_plugin_event"
  s.version = "0.1.3"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2012-03-16"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "CMS extension to manage events"
  s.summary = "CMS extension to manage events"
  
  s.add_runtime_dependency "ysd_core_plugins"
  s.add_runtime_dependency "ysd_md_fieldset" 
  s.add_runtime_dependency "ysd_md_cms"
  s.add_runtime_dependency "ysd_md_profile"

  s.add_runtime_dependency "ysd_yito_core"
  s.add_runtime_dependency "ysd_yito_js"

end